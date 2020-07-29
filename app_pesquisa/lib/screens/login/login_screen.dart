import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/helpers/validators.dart';
import 'package:test_port/models/page_manager.dart';
import 'package:test_port/models/user.dart';
import 'package:test_port/models/user_manager.dart';

class LoginScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: const Text("Sign Up", style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.of(context).pushNamed('/signup');
            },
          )
        ],
      ),
      body: Form(
          key: formKey,
          child: Consumer<UserManager>(
            builder: (_, userManager, __){
              return ListView(
            children: <Widget>[
              //? Login com Email e password
              Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email))
                          return "Invalid E-mail";
                        return null;
                      },
                    ),

                    SizedBox(height: 16,),

                    TextFormField(
                      controller: passwordController,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(hintText: "Password"),
                      autocorrect: false,
                      obscureText: true,
                      validator: (password){
                        if(password.isEmpty)
                          return "Invalid Password";
                        else if(password.length < 6)
                          return "Password too short";
                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Text("Forgot my password", style: TextStyle(color: Theme.of(context).primaryColor),),
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                      ),
                    )
                    
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                margin: EdgeInsets.only(right: 100, left: 100),
                //padding: EdgeInsets.all(32),
                child: FlatButton(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  color: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                  child: userManager.loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)) :
                  const Text("Log In", style: TextStyle(color: Colors.white, fontSize: 18),),
                  onPressed: userManager.loading ? null : (){
                    if(formKey.currentState.validate()){
                      userManager.signIn(
                        user: User(
                          email: emailController.text,
                          password: passwordController.text
                        ),

                        onFail: (e){
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("An error ocurred: $e"),
                              backgroundColor: Colors.red,
                            )
                          );
                        },

                        onSuccess: (){
                          Navigator.of(context).pop();
                        }

                      );
                    }
                  },
                ),
              )
              //? Botoes de login (Google e Facebook)
            ],
        );
            },
          ),
      ),
    );
  }
}
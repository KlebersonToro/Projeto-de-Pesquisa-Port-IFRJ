import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/helpers/validators.dart';
import 'package:test_port/models/user.dart';
import 'package:test_port/models/user_manager.dart';

class SignupScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Create Account'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Consumer<UserManager>(
          builder: (_, userManager, __) {
            return ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(24),
                  child: Column(
                    children: <Widget>[

                      TextFormField(
                        enabled: !userManager.loading,
                        decoration: InputDecoration(hintText: "Complete Name"),
                        autocorrect: false,
                        validator: (name) {
                          if (name.isEmpty)
                            return 'Cannot be empty';
                          else if (name.trim().split(' ').length <= 1)
                            return 'Fill up your complete name';
                          return null;
                        },
                        onSaved: (name) => user.name = name,
                      ),

                      SizedBox(height: 16,),

                      TextFormField(
                        enabled: !userManager.loading,
                        decoration: InputDecoration(hintText: "E-mail"),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email){
                          if(email.isEmpty)
                            return 'Cannot be empty';
                          else if(!emailValid(email))
                            return "Invalid E-mail";
                          return null;
                        },
                        onSaved: (email) => user.email = email,
                      ),

                      SizedBox(height: 16,),

                      TextFormField(
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
                        onSaved: (password) => user.password = password,
                      ),

                      SizedBox(height: 16,),

                      TextFormField(
                        enabled: !userManager.loading,
                        decoration: InputDecoration(hintText: "Confirm Password"),
                        autocorrect: false,
                        obscureText: true,
                        validator: (passwordC){
                          if(passwordC.isEmpty)
                            return "Invalid Password";
                          else if(passwordC.length < 6)
                            return "Password too short";
                          return null;
                        },
                        onSaved: (passwordC) => user.passwordConf = passwordC,
                      ),

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
                    const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18),),
                    onPressed: userManager.loading ? null : (){
                      if(formKey.currentState.validate()){
                        formKey.currentState.save();

                        if(user.password != user.passwordConf){
                          scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: const Text("Passwords didn't match"),
                                backgroundColor: Colors.red,
                              )
                            );
                          return;
                        }

                        userManager.signUp(
                          user: user,
                          onSuccess: (){
                            Navigator.of(context).pushNamedAndRemoveUntil('/base', (route) => false);
                          },
                          onFail: (e){
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("An error ocurred: $e"),
                                backgroundColor: Colors.red,
                              )
                            );
                          }
                        );

                      }
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

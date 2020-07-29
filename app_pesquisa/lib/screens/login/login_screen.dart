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
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: const Text("CRIAR CONTA", style: TextStyle(color: Colors.white),),
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
              //? Login com Email e Senha
              Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email))
                          return "Email Inválido";
                        return null;
                      },
                    ),

                    SizedBox(height: 16,),

                    TextFormField(
                      controller: senhaController,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(hintText: "Senha"),
                      autocorrect: false,
                      obscureText: true,
                      validator: (senha){
                        if(senha.isEmpty)
                          return "Senha Inválida";
                        else if(senha.length < 6)
                          return "Senha Inválida, muito curta";
                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Text("Esqueci a minha senha", style: TextStyle(color: Theme.of(context).primaryColor),),
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
                  const Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 18),),
                  onPressed: userManager.loading ? null : (){
                    if(formKey.currentState.validate()){
                      userManager.signIn(
                        user: User(
                          email: emailController.text,
                          password: senhaController.text
                        ),

                        onFail: (e){
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Falha ao entrar: $e"),
                              backgroundColor: Colors.red,
                            )
                          );
                        },

                        onSuccess: (){
                          context.read<PageManager>().setPage(1);
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
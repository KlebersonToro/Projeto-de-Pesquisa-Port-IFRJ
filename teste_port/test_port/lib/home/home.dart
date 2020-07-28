import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //? Feed, e rotas para as outras partes do app
    return Scaffold(
      drawer: Drawer(), //? Widget da "gaveta" posicionada a direita
      appBar: AppBar(
        title: Text("Aplicativo de pt"),//testando
        centerTitle: true,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //? Icones de rota
              IconButton(
                icon: Icon(Icons.library_books),
                iconSize: 50,
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  //? Script para realizar rota

                },
              ),
              SizedBox(width: 30,),
              IconButton(
                icon: Icon(Icons.gamepad),
                iconSize: 55,
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  //? Script para realizar rota

                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
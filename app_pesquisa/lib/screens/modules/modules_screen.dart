import 'package:flutter/material.dart';
import 'package:test_port/helpers/alert.dart';

class ModulesScreen extends StatefulWidget {
  @override
  _ModulesScreenState createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0, top: 20.0, left: 15.0, bottom: 20.0),
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index){
            return buildCards(context, index);
          }
        )
    );
  }
  Widget buildCards(context, index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Icon(Icons.library_books, size: 60),
              Column(
                children: <Widget>[
                  Text('Modulo ${index + 1}'),
                  Text('Tema do modulo')
                ],
              )
            ]
          )
        )
      ),
      onTap: (){
        alert(context, );
      },
    );
  }
}
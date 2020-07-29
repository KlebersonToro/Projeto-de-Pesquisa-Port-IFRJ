import 'package:flutter/material.dart';

class ModuleScreen extends StatefulWidget {
  @override
  _ModuleScreenState createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0, top: 20.0, left: 15.0, bottom: 20.0),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('Modulo x', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black)),
        Expanded(child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return buildCards(context, index);
          }
        ))
      ],
    ),
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
                  Text('Lição ${index + 1}'),
                  Text('Nome da lição')
                ],
              )
            ]
          )
        )
      ),
      onTap: (){

      },
    );
  }
}
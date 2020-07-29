import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  final bool teste = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons', style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
          return buildCard(context, index);
        }
      )
    )
    );
  }
  Widget buildCard(context, index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Icon(Icons.library_books, size: 60),
              Text('Lição ${index + 1}'),
              Checkbox(value: teste, onChanged: null)
            ]
          )
        )
      ),
      onTap: (){

      },
    );
  }
}
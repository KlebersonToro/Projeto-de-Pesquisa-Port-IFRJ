import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          child: Icon(Icons.border_color, color: Colors.black, size: 30,),
          onPressed: null
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:test_port/models/lesson.dart';

class LessonViewScreen extends StatelessWidget {
  //? It could be shown here a basic HyperText page, as a file from firebase_storage.

  LessonViewScreen({this.lesson});
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Text(
                    'Module:',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5,),
                  Text(lesson.module.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            ),

            /* Container(
              child: Row(
                children: [
                  Text('Module:'),
                  Text(lesson.module.toString())
                ],
              ),
            ), */

            Container(
              margin: EdgeInsets.all(12),
              child: Text(lesson.text, style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}

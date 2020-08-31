import 'package:flutter/material.dart';
import 'package:test_port/models/lesson.dart';

class LessonTile extends StatelessWidget {
  
  LessonTile({this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: InkWell(
          child: Padding(
              padding: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.library_books),
                title: Text(lesson.title),
                subtitle: Text(lesson.topic),
                
              )
              ),
              onTap: (){
                Navigator.of(context).pushNamed('/lessonview', arguments: lesson);
              },
        ),
      ),
    );
  }
}
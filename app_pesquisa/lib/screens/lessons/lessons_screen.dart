import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/models/lessons_manager.dart';
import 'package:test_port/screens/lessons/lesson_tile.dart';

class LessonScreen extends StatelessWidget {
  final bool teste = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lessons',
            //style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Consumer<LessonManager>(
              builder: (_, lessonsManager, __) {
                return ListView.builder(
                    itemCount: lessonsManager.allLessons.length,
                    itemBuilder: (context, index) {
                      return LessonTile(
                        //alertCtx: context,
                        lesson: lessonsManager.allLessons[index],
                      );
                    });
              },
            )));
  }

  /* Widget buildCard(context, index) {

    return Consumer<LessonManager>(
      builder: (_, lessonsManager, __) {
        return ListView.builder(
            itemCount: lessonsManager.allLessons.length,
            itemBuilder: (context, index) {
              return LessonTile(
                //alertCtx: context,
                lesson: lessonsManager.allLessons[index],
              );
            });
      },
    );

    /* return GestureDetector(
      child: Card(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Icon(Icons.library_books, size: 60),
                Text('Lição ${index + 1}'),
                Checkbox(value: teste, onChanged: null)
              ]))),
      onTap: () {},
    ); */
  } */
}

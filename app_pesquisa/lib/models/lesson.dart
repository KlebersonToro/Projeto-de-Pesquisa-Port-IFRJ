import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Lesson extends ChangeNotifier{

  Lesson({this.id,this.text,this.topic,this.title,this.module});

  Lesson.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    module = document['module'] as int;
    lessonNumber = document['lessonNumber'] as int;
    title = document['title'] as String;
    topic = document['topic'] as String;
    text = document['text'] as String;

    //? Adicionar outras propriedades

  }

  String id, text, topic, title;
  int module, lessonNumber;
  //List<image> images;
}
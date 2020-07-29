import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Lesson extends ChangeNotifier{

  Lesson({this.id,this.text,this.topic});

  Lesson.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    text = document['text'] as String;
    topic = document['topic'] as String;

    //? Adicionar outras propriedades

  }

  String id, text, topic;
  //List<image> images;
}
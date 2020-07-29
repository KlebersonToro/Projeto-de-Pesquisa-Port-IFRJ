import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Exercise extends ChangeNotifier{

  Exercise({this.id,this.text,this.topic});

  Exercise.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    text = document['text'] as String;
    topic = document['topic'] as String;

    //? Adicionar outras propriedades

  }

  String id, text, topic;
  //List<image> images;
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Module extends ChangeNotifier{

  Module({this.id,this.title,this.moduleNumber});

  Module.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    moduleNumber = document['module'] as int;
    title = document['title'] as String;
    desc = document['desc'] as String;
  }

  String id, desc, title;
  int moduleNumber;
  //List<image> images;
}
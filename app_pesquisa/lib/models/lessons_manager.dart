import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'lesson.dart';

class LessonManager extends ChangeNotifier {

  LessonManager(){
    _loadAllLessons();
  }

  final Firestore firestore = Firestore.instance;

  List<Lesson> allLessons = [];

  void _loadAllLessons() async {

    firestore.collection('lessons').orderBy('lessonNumber').snapshots().listen((snapshot) {
      allLessons.clear();
      List<DocumentSnapshot> d = snapshot.documents.toList();
      for(final DocumentSnapshot document in d){
        allLessons.add(Lesson.fromDocument(document));
      }
      notifyListeners();
    });

  }

}
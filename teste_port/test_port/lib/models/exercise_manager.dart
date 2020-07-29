import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'exercise.dart';

class ExerciseManager extends ChangeNotifier {

  ExerciseManager(){
    _loadAllLessons();
  }

  final Firestore firestore = Firestore.instance;

  List<Exercise> allExercises = [];

  void _loadAllLessons() async {

    firestore.collection('exercises').snapshots().listen((snapshot) {
      allExercises.clear();
      List<DocumentSnapshot> d = snapshot.documents.reversed.toList();
      for(final DocumentSnapshot document in d){
        allExercises.add(Exercise.fromDocument(document));
      }
      notifyListeners();
    });

  }

}
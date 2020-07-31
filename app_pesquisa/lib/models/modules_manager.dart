import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'module.dart';

class ModulesManager extends ChangeNotifier {

  ModulesManager(){
    _loadAllModules();
  }

  final Firestore firestore = Firestore.instance;

  List<Module> allModules = [];

  void _loadAllModules() async {

    firestore.collection('modules').orderBy('moduleNumber').snapshots().listen((snapshot) {
      allModules.clear();
      List<DocumentSnapshot> d = snapshot.documents.reversed.toList();
      for(final DocumentSnapshot document in d){
        allModules.add(Module.fromDocument(document));
      }
      notifyListeners();
    });

  }

}
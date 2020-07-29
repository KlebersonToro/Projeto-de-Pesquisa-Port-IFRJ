import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  User({this.id,this.name,this.email,this.password});

  User.fromDocument(DocumentSnapshot doc) {
    id = doc.documentID;
    name = doc.data['nome'] as String;
    email = doc.data['email'] as String;
  }

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  String id, name, email, password, passwordConf;
}

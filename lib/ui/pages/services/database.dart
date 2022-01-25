import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference profiles = FirebaseFirestore.instance.collection('profile');

  Future<void> updateUserData(String name, String photo, String biography, String oneLiner) async {
    return await profiles.doc(uid).set({
      'name': name,
      'photo': photo,
      'biography': biography,
      'oneLiner': oneLiner,
    });
  }
}
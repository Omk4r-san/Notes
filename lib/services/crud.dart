import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addTask(noteData) async {
    if (isLoggedIn()) {
      Firestore.instance.collection("notes").add(noteData).catchError((e) {
        print(e);
      });
    } else {
      print("U need to be Logged in");
    }
  }

  Future<Stream> getData() async {
    Stream result = await Firestore.instance.collection('notes').snapshots();
    return result;
  }

  deleteData(noteId) async {
    return Firestore.instance
        .collection('notes')
        .document(noteId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    // this.documentReference = doc.reference;

    documentID = doc.id;
    title = doc['title'];
    imageURL = doc['imageURL'];
    name = doc['name'];
    final Timestamp timestamp = doc['createdAt'];
    this.createdAt = timestamp.toDate();
  }

  String documentID;
  String title;
  String name;
  DateTime createdAt;
  String imageURL;

  // bool isDone = false;
  // DocumentReference documentReference;

  // String get documentID => null;
}

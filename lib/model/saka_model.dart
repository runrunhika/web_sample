import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class SakaModel extends ChangeNotifier {
  List<Todo> sakaList = [];
  String newSakaText = '';

  Future getSakaList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('sakaList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.sakaList = todoList;
    notifyListeners();
  }

  void getSakaListRealtime() {
    final snapshots =
        FirebaseFirestore.instance.collection('sakaList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      this.sakaList = todoList;
      notifyListeners();
    });
  }

  Future addSaka() async {
    if (newSakaText.length < 5) {
      throw ('5文字以上で投稿してください');
    }
    final collection = FirebaseFirestore.instance.collection('sakaList');
    await collection.add({
      'title': newSakaText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }

  // Future deleteSaka(Todo todo) async {
  //   await FirebaseFirestore.instance
  //       .collection('sakaList')
  //       .doc(todo.documentID)
  //       .delete();
  // }
}

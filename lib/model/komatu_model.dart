import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class KomatuModel extends ChangeNotifier {
  List<Todo> komatuList = [];
  String newKomatuText = '';

  Future getKomatuList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('chatList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.komatuList = todoList;
    notifyListeners();
  }

  void getKomatuListRealtime() {
    final snapshots =
        FirebaseFirestore.instance.collection('chatList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      this.komatuList = todoList;
      notifyListeners();
    });
  }

  Future addKomatu() async {
    if (newKomatuText.isEmpty) {
      throw ('タイトルを入力してください');
    }
    final collection = FirebaseFirestore.instance.collection('chatList');
    await collection.add({
      'title': newKomatuText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }

  Future deleteKomatu(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('chatList')
        .doc(todo.documentID)
        .delete();
  }
}

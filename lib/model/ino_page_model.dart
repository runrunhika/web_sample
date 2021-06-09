import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class MainModel extends ChangeNotifier {
  List<Todo> todoList = [];
  String newTodoText = '';

  Future getTodoList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('todoList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.todoList = todoList;
    notifyListeners();
  }

  void getTodoListRealtime() {
    final snapshots =
        FirebaseFirestore.instance.collection('todoList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      this.todoList = todoList;
      notifyListeners();
    });
  }

  Future addIno() async {
    if (newTodoText.isEmpty) {
      throw ('タイトルを入力してください');
    }
    final collection = FirebaseFirestore.instance.collection('todoList');
    await collection.add({
      'title': newTodoText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }

  Future deleteBook(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('todoList')
        .doc(todo.documentID)
        .delete();
  }
}

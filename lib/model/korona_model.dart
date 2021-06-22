import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class KoronaModel extends ChangeNotifier {
  List<Todo> koronaList = [];
  String newKoronaText = '';

  Future getKoronaList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('koronaList').get();
    final docs = snapshot.docs;
    final koronaList = docs.map((doc) => Todo(doc)).toList();
    this.koronaList = koronaList;
    notifyListeners();
  }

  void getKoronaListRealtime() {
    final snapshots =
        FirebaseFirestore.instance.collection('koronaList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final koronaList = docs.map((doc) => Todo(doc)).toList();
      koronaList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      this.koronaList = koronaList;
      notifyListeners();
    });
  }

  Future addKrona() async {
    if (newKoronaText.isEmpty) {
      throw ('タイトルを入力してください');
    }
    final collection = FirebaseFirestore.instance.collection('koronaList');
    await collection.add({
      'title': newKoronaText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }

  Future deleteBook(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('koronaList')
        .doc(todo.documentID)
        .delete();
  }
}

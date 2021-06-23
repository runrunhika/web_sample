import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class NewModel extends ChangeNotifier {
  List<Todo> newList = [];
  String newNewText = '';

  Future addNew() async {
    if (newNewText.length < 5) {
      throw ('5文字以上で投稿してください');
    }
    final collection = FirebaseFirestore.instance.collection('newList');
    await collection.add({
      'title': newNewText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }
}

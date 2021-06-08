import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class ChatModel extends ChangeNotifier {
  List<Todo> chatList = [];
  String newChatText = '';

  Future getChatList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('chatList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.chatList = todoList;
    notifyListeners();
  }

  void getChatListRealtime() {
    final snapshots =
        FirebaseFirestore.instance.collection('chatList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      this.chatList = todoList;
      notifyListeners();
    });
  }

  Future addChat() async {
    final collection = FirebaseFirestore.instance.collection('chatList');
    await collection.add({
      'title': newChatText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }

  Future deleteChat(Todo todo) async {
    await FirebaseFirestore.instance
        .collection('chatList')
        .doc(todo.documentID)
        .delete();
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/domain/data.dart';

class KoronaModel extends ChangeNotifier {
  List<Todo> koronaList = [];
  File imageFile;
  bool isLoading = false;
  String name = '';
  String newKoronaText = '';

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

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addKrona() async {
    if (newKoronaText.length < 5) {
      throw ('5文字以上で投稿してください');
    }
    final imageURL = await _uploadImageFile();
    FirebaseFirestore.instance.collection('koronaList').add(
      {
        'title': newKoronaText,
        'imageURL': imageURL,
        'name': name,
        'createdAt': Timestamp.now(),
      },
    );
  }

  setImage(File imageFile) {
    this.imageFile = imageFile;
    notifyListeners();
  }

  Future<String> _uploadImageFile() async {
    if (imageFile.path.isEmpty) {
      return '';
    }
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('books').child(newKoronaText);
    final snapshot = await ref.putFile(
      imageFile,
    );
    final downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}

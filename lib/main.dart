import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/domain/data.dart';
import 'package:web_sample/screen/add_page.dart';

import 'model/list_page_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '掲示板',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getTodoListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('掲示板'),
          centerTitle: true,
          // actions: [
          //   Consumer<MainModel>(builder: (context, model, child) {
          //     final isActive = model.checkShouldActiveCompleteButton();
          //     return FlatButton(
          //       onPressed: isActive
          //           ? () async {
          //               await model.deleteCheckedItems();
          //             }
          //           : null,
          //       child: Text(
          //         '完了',
          //         style: TextStyle(
          //           color:
          //               isActive ? Colors.white : Colors.white.withOpacity(0.5),
          //         ),
          //       ),
          //     );
          //   })
          // ],
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          final todoList = model.todoList;
          return ListView(
            children: todoList
                .map(
                  (todo) => ListTile(
                    title: Text(
                      '名無し　' + todo.createdAt.toString(),
                      style: TextStyle(color: Colors.grey.withOpacity(.6)),
                    ),
                    subtitle: Text(
                      todo.title,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
                .toList(),
          );
        }),
        floatingActionButton:
            Consumer<MainModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(model),
                  fullscreenDialog: true,
                ),
              );
            },
            label: const Text('Tweet'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.pink,
          );
        }),
      ),
    );
  }
}

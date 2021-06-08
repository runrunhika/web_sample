import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/list_page_model.dart';

import 'add_page.dart';

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
          title: Text('井上ゆうじを特定する'),
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

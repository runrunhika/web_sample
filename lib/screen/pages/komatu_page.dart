import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/komatu_model.dart';

import '../add/add_komatu_page.dart';

class KomatuPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<KomatuPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KomatuModel>(
      create: (_) => KomatuModel()..getKomatuListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('小松がロックバンドやるらしいwwwwww'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => MyHomePage()));
          },)),
        body: Consumer<KomatuModel>(builder: (context, model, child) {
          final todoList = model.komatuList;
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
            Consumer<KomatuModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddKomatuPage(model),
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

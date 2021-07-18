import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/saka_model.dart';

import '../add/add_saka_page.dart';
import 'main_page.dart';

class SakaPage extends StatefulWidget {
  @override
  _SakaPageState createState() => _SakaPageState();
}

class _SakaPageState extends State<SakaPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SakaModel>(
      create: (_) => SakaModel()..getSakaListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('お茶の間（情報交換）'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => MainPage()));
          },)),
        body: Consumer<SakaModel>(builder: (context, model, child) {
          final todoList = model.sakaList;
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
            Consumer<SakaModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddSakaPage(model),
                  fullscreenDialog: true,
                ),
              );
            },
            label: const Text('投稿する'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.pink,
          );
        }),
      ),
    );
  }
}

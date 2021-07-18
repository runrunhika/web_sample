import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/korona_model.dart';

import '../add/add_korona_page.dart';
import 'main_page.dart';

class KoronaPage extends StatefulWidget {
  @override
  _KoronaPageState createState() => _KoronaPageState();
}

class _KoronaPageState extends State<KoronaPage> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KoronaModel>(
      create: (_) => KoronaModel()..getKoronaListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('コロナ速報'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => MainPage()));
          },)
        ),
        body: Consumer<KoronaModel>(builder: (context, model, child) {
          final koronaList = model.koronaList;
          return ListView(
            children: koronaList
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
            Consumer<KoronaModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddKoronaPage(model),
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

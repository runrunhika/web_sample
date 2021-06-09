import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/komatu_model.dart';

import '../pages/komatu_page.dart';

class AddKomatuPage extends StatelessWidget {
  final KomatuModel model;
  AddKomatuPage(this.model);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KomatuModel>.value(
      value: model,
      child: Scaffold(
        appBar: AppBar(
            actions: [
              TextButton(
                child: Text(
                  '投稿',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await addBookKomatu(model, context);
                },
              ),
            ],
            leading: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => KomatuPage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<KomatuModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  maxLength: 120,
                  maxLines: 6,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.lightBlue.shade100,
                    border: OutlineInputBorder(),
                    labelText: "掲示板に投稿したい内容を記入しよう",
                    hintText: "大日本帝国万歳",
                  ),
                  onChanged: (text) {
                    model.newKomatuText = text;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future addBookKomatu(KomatuModel model, BuildContext context) async {
    try {
      await model.addKomatu();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('投稿しました'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      Navigator.of(context).pop();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: <Widget>[
              ElevatedButton(
                child: Text('はい！イエッサ！！！'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

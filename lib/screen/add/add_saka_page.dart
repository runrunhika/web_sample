import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/saka_model.dart';

import '../pages/saka_page.dart';

class AddSakaPage extends StatefulWidget {
  final SakaModel model;
  AddSakaPage(this.model);

  @override
  _AddSakaPageState createState() => _AddSakaPageState();
}

class _AddSakaPageState extends State<AddSakaPage> {
  final _sakaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SakaModel>.value(
      value: widget.model,
      child: Scaffold(
        appBar: AppBar(
            actions: [
              TextButton(
                child: Text(
                  '投稿',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await addSaka(widget.model, context);
                },
              ),
            ],
            leading: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => SakaPage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<SakaModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  maxLength: 120,
                  maxLines: 6,
                  controller: _sakaController,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.lightBlue.shade100,
                    border: OutlineInputBorder(),
                    labelText: "掲示板に投稿したい内容を記入しよう",
                    hintText: "大日本帝国万歳",
                  ),
                  onChanged: (text) {
                    model.newSakaText = text;
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

  Future addSaka(SakaModel model, BuildContext context) async {
    try {
      await model.addSaka();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('投稿しました'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    _sakaController.clear();
                    model.newSakaText = "";
                  });
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

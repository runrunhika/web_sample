import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/korona_model.dart';
import 'package:web_sample/screen/pages/korona_page.dart';

class AddKoronaPage extends StatefulWidget {
  final KoronaModel model;
  AddKoronaPage(this.model);

  @override
  _AddKoronaPageState createState() => _AddKoronaPageState();
}

class _AddKoronaPageState extends State<AddKoronaPage> {
  final _koronaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KoronaModel>.value(
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
                  // firestoreに値を追加する
                  await addBook(widget.model, context);
                },
              ),
            ],
            leading: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => MainPage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<KoronaModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  maxLength: 120,
                  maxLines: 10,
                  controller: _koronaController,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.lightBlue.shade100,
                    border: OutlineInputBorder(),
                    labelText: "掲示板に投稿したい内容を記入しよう",
                    hintText: "大日本帝国万歳",
                  ),
                  onChanged: (text) {
                    model.newKoronaText = text;
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future addBook(KoronaModel model, BuildContext context) async {
    try {
      await model.addKrona();
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
                    _koronaController.clear();
                    model.newKoronaText = "";
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

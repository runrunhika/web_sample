import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/new_model.dart';

class AddNewPage extends StatefulWidget {
  final NewModel model;
  AddNewPage(this.model);

  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final _newController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewModel>.value(
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
                  await addNew(widget.model, context);
                },
              ),
            ],
            leading: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => MyHomePage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<NewModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  maxLength: 120,
                  maxLines: 10,
                  controller: _newController,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.lightBlue.shade100,
                    border: OutlineInputBorder(),
                    labelText: "掲示板に投稿したい内容を記入しよう",
                    hintText: "大日本帝国万歳",
                  ),
                  onChanged: (text) {
                    model.newNewText = text;
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future addNew(NewModel model, BuildContext context) async {
    try {
      await model.addNew();
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
                    _newController.clear();
                    model.newNewText = "";
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

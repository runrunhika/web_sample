import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/new_model.dart';
import 'package:web_sample/screen/pages/main_page.dart';

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
          title: Text("スレッド追加要求"),
            actions: [
              TextButton(
                child: Text(
                  '運営に送信する',
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
                      MaterialPageRoute(builder: (ctx) => MainPage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<NewModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  maxLength: 20,
                  maxLines: 2,
                  controller: _newController,
                  decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.lightBlue.shade100,
                    border: OutlineInputBorder(),
                    labelText: "追加して欲しいスレッドを要求してみよう",
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
            title: Text('要求完了'),
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
                child: Text('OK'),
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

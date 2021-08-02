import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/korona_model.dart';
import 'package:web_sample/screen/pages/korona_page.dart';
import 'package:web_sample/screen/pages/main_page.dart';

class AddKoronaPage extends StatefulWidget {
  final KoronaModel model;
  AddKoronaPage(this.model);

  @override
  _AddKoronaPageState createState() => _AddKoronaPageState();
}

class _AddKoronaPageState extends State<AddKoronaPage> {
  final textEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KoronaModel>.value(
      value: widget.model,
      child: Scaffold(
        appBar: AppBar(
            leading: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => KoronaPage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<KoronaModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "任意",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextField(
                      controller: nameEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.lightBlue.shade100,
                        border: OutlineInputBorder(),
                        labelText: "ニックネーム",
                      ),
                      onChanged: (text) {
                        model.name = text;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "任意",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // TODO: カメラロール開いて写真選ぶ
                        final pickedFile =
                            await picker.getImage(source: ImageSource.camera);
                        model.setImage(File(pickedFile.path));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 160,
                        child: model.imageFile != null
                            ? Image.file(model.imageFile)
                            : Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "必須",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextField(
                      maxLength: 60,
                      maxLines: 5,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.lightBlue.shade100,
                        border: OutlineInputBorder(),
                        labelText: "掲示板に投稿したい内容を記入しよう",
                      ),
                      onChanged: (text) {
                        model.newKoronaText = text;
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text('追加する'),
                  onPressed: () async {
                    model.startLoading();

                    await addBook(model, context);

                    model.endLoading();
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
            title: Text('投稿完了'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('掲示板に行く'),
                onPressed: () {
                  setState(() {
                    textEditingController.clear();
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

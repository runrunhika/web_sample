import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/chat_model.dart';

import 'chat_page.dart';

class AddChatPage extends StatelessWidget {
  final ChatModel model;
  AddChatPage(this.model);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatModel>.value(
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
                  // firestoreに値を追加する
                  await model.addChat();
                  Navigator.pop(context);
                },
              ),
            ],
            leading: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => ChatPage()));
                },
                child: Text("戻る", style: TextStyle(color: Colors.white)))),
        body: Consumer<ChatModel>(builder: (context, model, child) {
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
                    hintText: "大日本帝国以外くそ",
                  ),
                  onChanged: (text) {
                    model.newChatText = text;
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
}

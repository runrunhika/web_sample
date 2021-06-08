import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/chat_model.dart';

import 'add_chat_page.dart';
import 'add_page.dart';

class ChatPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatModel>(
      create: (_) => ChatModel()..getChatListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('小松がロックバンドやるらしいwwwwww'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => MyHomePage()));
          },)),
          // actions: [
          //   Consumer<MainModel>(builder: (context, model, child) {
          //     final isActive = model.checkShouldActiveCompleteButton();
          //     return FlatButton(
          //       onPressed: isActive
          //           ? () async {
          //               await model.deleteCheckedItems();
          //             }
          //           : null,
          //       child: Text(
          //         '完了',
          //         style: TextStyle(
          //           color:
          //               isActive ? Colors.white : Colors.white.withOpacity(0.5),
          //         ),
          //       ),
          //     );
          //   })
          // ],
        
        body: Consumer<ChatModel>(builder: (context, model, child) {
          final todoList = model.chatList;
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
            Consumer<ChatModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddChatPage(model),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/komatu_model.dart';

import '../add/add_komatu_page.dart';

class KomatuPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<KomatuPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KomatuModel>(
      create: (_) => KomatuModel()..getKomatuListRealtime(),
      child: Scaffold(
                backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('小松がロックバンドやるらしいwwwwww', style: TextStyle(color: Colors.red),),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (ctx) => MyHomePage()));
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
        
        body: Consumer<KomatuModel>(builder: (context, model, child) {
          final todoList = model.komatuList;
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
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
                .toList(),
          );
        }),
        floatingActionButton:
            Consumer<KomatuModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddKomatuPage(model),
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

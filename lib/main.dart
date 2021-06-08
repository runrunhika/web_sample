import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/domain/data.dart';
import 'package:web_sample/screen/add_page.dart';
import 'package:web_sample/screen/chat_page.dart';
import 'package:web_sample/screen/main_page.dart';

import 'model/list_page_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '掲示板',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('掲示板'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          InkWell(
            child: Container(
              width: double.infinity,
              child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text(
                      "井上の件",
                      style: TextStyle(
                          fontSize: 40,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                    trailing: Icon(Icons.backup),
                  )),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => MainPage()));
            },
          ),
          InkWell(
            child: Container(
              child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text("小松がロックバンドやるらしいwwwwww",
                        style: TextStyle(
                            fontSize: 40,
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    trailing: Icon(Icons.backup),
                  )),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => ChatPage()));
            },
          ),
        ],
      ),
    );
  }
}

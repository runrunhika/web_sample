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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '掲示板',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        leading: Container(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: InkWell(
              child: Container(
                width: double.infinity,
                child: Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                        "井上の件",
                        style: TextStyle(
                            fontSize: 30,
                            decoration: TextDecoration.underline,
                            color: Colors.red),
                      ),
                      leading: Icon(
                        Icons.arrow_circle_up,
                        color: Colors.red,
                      ),
                    )),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => MainPage()));
              },
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: InkWell(
              child: Container(
                child: Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text("小松がロックバンドやるらしいwwwwww",
                          style: TextStyle(
                              fontSize: 30,
                              decoration: TextDecoration.underline,
                              color: Colors.red)),
                      leading: Icon(
                        Icons.arrow_circle_up,
                        color: Colors.red,
                      ),
                    )),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => ChatPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

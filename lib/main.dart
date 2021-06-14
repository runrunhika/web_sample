import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_sample/screen/pages/ino_page.dart';
import 'package:web_sample/screen/utils/ino_utils.dart';
import 'package:web_sample/screen/utils/komatu_utils.dart';
import 'package:web_sample/test/homeScreen.dart';

import 'screen/pages/komatu_page.dart';

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
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          '''
万          我         万
歳          ら         歳
万          大         万
歳          日         歳
万          本         万
歳          帝         歳
万          国         万
          ''',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (controller.text != "1942091") {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('gm ks usero'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => HomeScreen()));
                }
              })
        ],
        title: TextField(
          obscureText: true,
          keyboardType: TextInputType.number,
          controller: controller,
        ),
      ),
      body: ListView(
        children: [
          Divider(
            color: Colors.white,
          ),
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
                    context, MaterialPageRoute(builder: (ctx) => inoUtils()));
              },
            ),
          ),
          Divider(
            color: Colors.white,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => komatuUtils()));
              },
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

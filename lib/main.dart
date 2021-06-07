import 'package:flutter/material.dart';
import 'package:web_sample/screen/page1.dart';
import 'package:web_sample/screen/page2.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '心理学者監修',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ラインでわかるバカの特徴4選"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/unnamed.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1  スタンプで会話する",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "間抜けなので、言語能力が著しく欠損してるのでしょうね",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(.7)),
                ),
              ),
              Divider(),
              Text(
                "2  花火やりたがる",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "光があるところに集まるようです。虫のようですね",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(.7)),
                ),
              ),
              Divider(),
              Text(
                "3  白石町在住",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "治安が悪い地域のようです。これ以上の詮索は良しとしましょう",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(.7)),
                ),
              ),
              Divider(),
              Text(
                "4  井上　友一　ってやつ",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "顔相占い的にみて、雨　のち　地獄でしょう　\n\n\n てか、きっしょ　うえぇえぇぇ",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(.7)),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.pink)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "他の記事をみてみる",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => Page1()));
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Mさんは語る！　井上の個人情報！！！',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => Page2()));
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('秘密の部屋',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

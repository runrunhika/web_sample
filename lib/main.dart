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
  // await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '掲示板',
//       home: FirstPage(),
//     );
//   }
// }

// class FirstPage extends StatefulWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   @override
//   void initState() {
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => MyHomePage()));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Text(
//           '''
// 万          我         万
// 歳          ら         歳
// 万          大         万
// 歳          日         歳
// 万          本         万
// 歳          帝         歳
// 万          国         万
//           ''',
//           style: TextStyle(color: Colors.white, fontSize: 50),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         leading: Container(),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 if (controller.text != "1942091") {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('gm ks usero'),
//                         actions: <Widget>[
//                           ElevatedButton(
//                             child: Text('OK'),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 } else {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (ctx) => HomeScreen()));
//                 }
//               })
//         ],
//         title: TextField(
//           obscureText: true,
//           keyboardType: TextInputType.number,
//           controller: controller,
//         ),
//       ),
//       body: ListView(
//         children: [
//           Divider(
//             color: Colors.white,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 28.0),
//             child: InkWell(
//               child: Container(
//                 width: double.infinity,
//                 child: Align(
//                     alignment: Alignment.center,
//                     child: ListTile(
//                       title: Text(
//                         "井上の件",
//                         style: TextStyle(
//                             fontSize: 30,
//                             decoration: TextDecoration.underline,
//                             color: Colors.red),
//                       ),
//                       leading: Icon(
//                         Icons.arrow_circle_up,
//                         color: Colors.red,
//                       ),
//                     )),
//               ),
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (ctx) => inoUtils()));
//               },
//             ),
//           ),
//           Divider(
//             color: Colors.white,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 28.0),
//             child: InkWell(
//               child: Container(
//                 child: Align(
//                     alignment: Alignment.center,
//                     child: ListTile(
//                       title: Text("小松がロックバンドやるらしいwwwwww",
//                           style: TextStyle(
//                               fontSize: 30,
//                               decoration: TextDecoration.underline,
//                               color: Colors.red)),
//                       leading: Icon(
//                         Icons.arrow_circle_up,
//                         color: Colors.red,
//                       ),
//                     )),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (ctx) => komatuUtils()));
//               },
//             ),
//           ),
//           Divider(
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'unc',
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
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "ようこそ！\nunc\nホームページへ",
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      )),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("unc"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft)),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "プライバシーポリシー",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ))
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Image(image: AssetImage('assets/japan.png')),
            ],
          ),
          Image(
            image: AssetImage('assets/japan.png'),
            fit: BoxFit.cover,
          ),

          //service
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.greenAccent])),
            child: Center(
              child: Text(
                "サービス",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.greenAccent])),
            child: Center(
              child: Text(
                "事業内容",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),
          //Image
          Container(
            width: double.infinity,
            height: 400,
            child: Image(
              image: AssetImage('assets/japan.png'),
              fit: BoxFit.cover,
            ),
          ),
          //Android & Ios
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                      Text(
                        "スマホアプリ開発",
                        style: TextStyle(fontSize: 25),
                      ),
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 400,
            child: Image(
              image: AssetImage('assets/japan.png'),
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.3)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                      Text(
                        "Webサイト作成",
                        style: TextStyle(fontSize: 25),
                      ),
                      Icon(
                        Icons.all_inclusive,
                        color: Colors.red[300],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          //会社概要
          Image(
            image: AssetImage('assets/japan.png'),
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.8),
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.greenAccent])),
            child: Center(
              child: Text(
                "会社概要",
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
          ),

          //本文
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      ListTile(
                        leading: Text("資本金"),
                        title: Center(child: Text("120万円")),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text("設立日"),
                        title: Center(child: Text("2020年7月28日")),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text("主な事業内容"),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/japan.png')),
                    ],
                  ),
                )
              ])),

          //contact
          Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.8),
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.greenAccent])),
              child: Center(
                child: Text(
                  "お問い合わせ",
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
              )),
          // Mail
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.mail,
                size: 200,
                color: Colors.grey.withOpacity(.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("メールでのお問い合わせ", style: TextStyle(fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Phone
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.phone,
                size: 200,
                color: Colors.grey.withOpacity(.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("お電話でのお問い合わせ", style: TextStyle(fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                    )
                  ],
                ),
              ),
            ],
          ),

          //ボトム
          BottomAppBar(
            elevation: 30,
            color: Colors.cyan.withOpacity(.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "元昜システム株式会社",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_sample/screen/pages/ino_page.dart';

class komatuUtils extends StatefulWidget {
  const komatuUtils({Key? key}) : super(key: key);

  @override
  _komatuUtilsState createState() => _komatuUtilsState();
}

class _komatuUtilsState extends State<komatuUtils> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "⚠️注意",
                  style: TextStyle(fontSize: 40, color: Colors.yellow),
                ),
                Text('''
この掲示板は、運営者が厳重に監視しております。
以下に該当する行為を行ったユーザは、取得したIPアドレスから、ユーザーのデバイスへ不法行為を行いますが、
当サービスは一切の責任を追いませんあらかじめご了承ください
''', style: TextStyle(fontSize: 17,color: Colors.red)),
                Text('''
1・運営者への誹謗中傷
2・運営者が敵と定めたものを庇う
3・運営者が敵と定めたものへの攻撃を躊躇及びしない
4・運営者の意向にそぐわない
5・運営者への讒言
6・運営者が全ての1番であることを疑問に思う
''', style: TextStyle(fontSize: 14,color: Colors.white)),
                Text("ルールを守って楽しく遊びましょう♪\n\n\n\n",
                    style: TextStyle(color: Colors.pink[100])),
                Text("なお、実験という名目で心理誘導などを行いますが、悪質なものではございません", style: TextStyle(color: Colors.red))
              ]),
        ));
  }
}

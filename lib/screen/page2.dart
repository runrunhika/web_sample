import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("送ったURLを検索すれば、全世界の人がこのWebページ見れます！\nあと、井上くんにサーバー代など請求します"),),
    );
  }
}
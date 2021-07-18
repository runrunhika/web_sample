import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'screen/pages/main_page.dart';

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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = FadeInController();

  @override
  void initState() {
    _controller.fadeIn();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/icon.png',
              fit: BoxFit.cover,
              width: 250,
              height: 250,
            ),
            SizedBox(
              height: 30,
            ),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 30.0, color: Colors.black),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('The space is my garden'),
                ],
                isRepeatingAnimation: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FadeIn(
                controller: _controller,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (ctx) => MainPage()));
                  },
                  child: Text("タップ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40)),
                ),
                duration: Duration(seconds: 5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                  width: 25,
                  height: 25,
                  child: CircleAvatar(
                    backgroundColor: Colors.limeAccent,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

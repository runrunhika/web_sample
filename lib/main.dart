import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset('assets/download.jpg'),
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/flutter-web-82849.appspot.com/o/siteImg%2Ffire.png?alt=media&token=b93ee45c-1a4f-467a-a06e-cfdef062a956',
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://github.com/runrunhika/photos/blob/main/firebase.png?raw=true',
            fit: BoxFit.contain,
          ),
          Image.network(
            'https://github.com/runrunhika/photos/blob/main/flutter.png?raw=true',
            fit: BoxFit.fitHeight,
          ),
          Image.network(
              'https://github.com/runrunhika/photos/blob/main/hart.jpg?raw=true')
        ],
      ),
    );
  }
}

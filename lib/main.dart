// import 'dart:async';
// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:web_sample/screen/pages/ino_page.dart';
// import 'package:web_sample/screen/utils/ino_utils.dart';
// import 'package:web_sample/screen/utils/komatu_utils.dart';

// import 'screen/pages/komatu_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           '掲示板',
//           style: TextStyle(color: Colors.red),
//         ),
//         centerTitle: true,
//         leading: Container(),
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

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  String inputText = '';
  bool _loading = false;
  List<String> _translatedTexts = [];
  List<String> _languagesCode = [
    'en',
    'ja',
    'zh-cn',
    'fr',
    'ru',
    'de',
    'it',
    'es',
    'hi'
  ];

  Future translate() async {
    List<String> translatedTexts = [];
    setState(() {
      _loading = true;
    });
    for (String code in _languagesCode) {
      Translation translation = await translator.translate(inputText, to: code);
      String translatedText = translation.text;
      translatedTexts.add(translatedText);
    }
    setState(() {
      _translatedTexts = translatedTexts;
      _loading = false;
      print(_translatedTexts);
    });
  }

  Future speak(String languageCode, String text) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '人は皆無価値',
      )),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(25),
                hintText: '単語・文を入力',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xff263238),
                suffixIcon: _loading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.translate,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (inputText.isNotEmpty) translate();
                        },
                      ),
              ),
              onChanged: (input) {
                inputText = input;
              },
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('en-US', _translatedTexts[0]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/united-states.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'English United States\n（アメリカ）'
                                : _translatedTexts[0],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('en-GB', _translatedTexts[0]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/united-kingdom.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'English United Kingdom\n（イギリス）'
                                : _translatedTexts[0],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('ja-JP', _translatedTexts[1]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/japan.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? '日本'
                                : _translatedTexts[1],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('zh-CN', _translatedTexts[2]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/china.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'Chinese（中国）'
                                : _translatedTexts[2],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('fr-FR', _translatedTexts[3]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/france.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'French（フランス）'
                                : _translatedTexts[3],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('ru-RU', _translatedTexts[4]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/russia.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'Russian（ロシア）'
                                : _translatedTexts[4],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('de-DE', _translatedTexts[5]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/germany.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'German（ドイツ）'
                                : _translatedTexts[5],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('it-IT', _translatedTexts[6]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/italy.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'Italian（イタリア）'
                                : _translatedTexts[6],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('es-ES', _translatedTexts[7]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/spain.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'Spanish（スペイン）'
                                : _translatedTexts[7],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_translatedTexts.isNotEmpty)
                        speak('hi-IN', _translatedTexts[8]);
                    },
                    child: Container(
                      color: Color(0xff263238),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/india.png',
                            width: 50,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            _translatedTexts.isEmpty
                                ? 'Hindi（インド）'
                                : _translatedTexts[8],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

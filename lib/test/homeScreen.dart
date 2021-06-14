import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

import '../main.dart';

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
      ;
    });
  }

  Future speak(String languageCode, String text) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => MyHomePage()));
        },
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

import 'dart:convert';
import 'dart:html';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:web_sample/widget/utils.dart';
import 'package:http/http.dart' as http;

class WebHomePage extends StatefulWidget {
  const WebHomePage({Key? key}) : super(key: key);

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  bool isReadMore = false;
  bool isReadMore2 = false;
  bool isReadMore3 = false;

  late final nameCont = TextEditingController();
  late final emailCont = TextEditingController();
  final subjectCont = TextEditingController();
  final messageCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final namefocus = FocusNode();
  final agefocus = FocusNode();

  _showSnackBar() {
    Get.snackbar('送信完了', '返信お待ちください',
        backgroundColor: Colors.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.TOP);
  }

  int index = 0;

  static List<String> values = [
    '2021　結成',
    '2022　下積み時代',
    '2024　Mステ出演',
    '2025　武道館',
    '2031　メンバー死去・解散',
    'ご愛読ありがとうございました'
  ];

  final itemKey = GlobalKey();
  final itemKey2 = GlobalKey();
  final itemKey3 = GlobalKey();
  final itemKey4 = GlobalKey();

  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  Future scrollToItem() async {
    final context = itemKey.currentContext;

    await Scrollable.ensureVisible(context!,
        alignment: 0.0, duration: Duration(seconds: 1));
  }

  Future scrollToItem2() async {
    final context2 = itemKey2.currentContext;

    await Scrollable.ensureVisible(context2!,
        alignment: 0, duration: Duration(seconds: 2));
  }

  Future scrollToItem3() async {
    final context2 = itemKey3.currentContext;

    await Scrollable.ensureVisible(context2!,
        alignment: 0, duration: Duration(seconds: 2));
  }

  Future scrollToItem4() async {
    final context2 = itemKey4.currentContext;

    await Scrollable.ensureVisible(context2!,
        alignment: 0, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THE PIPES'),
        centerTitle: true,
        leading: Container(),
      ),
      floatingActionButton: FabCircularMenu(
        fabOpenColor: Colors.yellow,
        fabCloseColor: Colors.white,
        ringColor: Colors.yellowAccent,
        alignment: Alignment.bottomCenter,
        children: [
          TextButton.icon(
              icon: Icon(Icons.person),
              onPressed: scrollToItem,
              label: Text('BandMenber')),
          TextButton.icon(
              icon: Icon(Icons.music_note),
              onPressed: scrollToItem2,
              label: Text('Music')),
          TextButton.icon(
              icon: Icon(Icons.history),
              onPressed: scrollToItem3,
              label: Text('History')),
          TextButton.icon(
              icon: Icon(Icons.contact_mail),
              onPressed: scrollToItem4,
              label: Text('Contact')),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 700,
                width: 700,
                child: Image.asset(
                  'assets/bandM.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              //BandMenber
              Container(
                key: itemKey,
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.orange, Colors.blue],
                )),
                child: Center(
                  child: Text(
                    "BandMenber",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),

              Container(
                width: 400,
                height: 400,
                child: Image.asset(
                  'komatu.jpg',
                ),
              ),

              Container(
                width: 400,
                height: 400,
                child: Image.asset(
                  'shota.jpg',
                ),
              ),

              Container(
                width: 400,
                height: 400,
                child: Image.asset(
                  'hikaru.jpg',
                ),
              ),
              //Music
              Container(
                key: itemKey2,
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.orange, Colors.blue],
                )),
                child: Center(
                  child: Text(
                    "Music",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              Text('君の吸ったタバコ'),
              buildText('''
              歌詞
              unchi
              unchi kusai
              '''),
              Text('乳首'),
              buildText2('''
              歌詞
              unchi
              unchi kusai
              '''),
              Text('憎しみの連鎖'),
              buildText3('''
              歌詞
              unchi
              unchi kusai
              '''),
              //History
              Container(
                key: itemKey3,
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.orange, Colors.blue],
                )),
                child: Center(
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),

              buildCustomPicker(),
              //Contact
              Container(
                key: itemKey4,
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.orange, Colors.blue],
                )),
                child: Center(
                  child: Text(
                    "Contact",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              buildTextField(
                  title: 'お名前',
                  controller: nameCont,
                  icon: Icon(Icons.person),
                  hint: '山田太郎　または　会社名'),

              emailTextField(
                  title: 'メールアドレス',
                  controller: emailCont,
                  icon: Icon(Icons.mail),
                  hint: 'example@mail.com'),
              buildTextField(
                  title: '件名',
                  controller: subjectCont,
                  icon: Icon(Icons.subject),
                  hint: '〇〇の依頼'),
              contentTextField(
                  title: '内容',
                  controller: messageCont,
                  icon: Icon(Icons.edit),
                  hint: ''),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          sendEmail(
                              name: nameCont.text,
                              email: emailCont.text,
                              subject: subjectCont.text,
                              message: messageCont.text);
                        });
                        _showSnackBar();
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                              colors: [Colors.lightBlue, Colors.white]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(.6),
                                spreadRadius: 1,
                                blurRadius: 16,
                                offset: Offset(8, 8))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "送信する",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )), //ボトム
              BottomAppBar(
                elevation: 30,
                color: Colors.cyan.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "THE　PIPES",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomPicker() => SizedBox(
        height: 300,
        child: CupertinoPicker(
          itemExtent: 64,
          diameterRatio: 0.7,
          looping: true,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
          // selectionOverlay: Container(),
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: Colors.pink.withOpacity(0.12),
          ),
          children: Utils.modelBuilder<String>(
            values,
            (index, value) {
              final isSelected = this.index == index;
              final color = isSelected ? Colors.pink : Colors.black;

              return Center(
                child: Text(
                  value,
                  style: TextStyle(color: color, fontSize: 24),
                ),
              );
            },
          ),
        ),
      );

  Widget buildText(String text) {
    final styleButton = TextStyle(
        fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold);

    return ReadMoreText(
      text,
      trimLength: 1,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: '詳細',
      trimExpandedText: '戻す',
      style: TextStyle(fontSize: 20),
      lessStyle: styleButton,
      moreStyle: styleButton,
    );
  }

  Widget buildText2(String text) {
    final styleButton = TextStyle(
        fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold);

    return ReadMoreText(
      text,
      trimLength: 1,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: '詳細',
      trimExpandedText: '戻す',
      style: TextStyle(fontSize: 20),
      lessStyle: styleButton,
      moreStyle: styleButton,
    );
  }

  Widget buildText3(String text) {
    final styleButton = TextStyle(
        fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold);

    return ReadMoreText(
      text,
      trimLength: 1,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: '詳細',
      trimExpandedText: '戻す',
      style: TextStyle(fontSize: 20),
      lessStyle: styleButton,
      moreStyle: styleButton,
    );
  }

  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final serviceId = 'service_1cwqwpt';
    final tempateId = 'template_1i08wn1';
    final userId = 'user_QJq7e6a5biy5mQMKpkqSs';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': tempateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'to_email': 'mirokurokumi@gmail.com',
            'user_subject': subject,
            'user_message': message
          }
        }));
    print(response.body);
  }

  Widget buildTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '入力してください';
                }
              },
              decoration: InputDecoration(
                  prefixIcon: icon,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey)),
              textInputAction: TextInputAction.done,
              controller: controller,
              enabled: true,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ],
        ),
      );

  Widget emailTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  hintText: 'example@mail.com',
                  hintStyle: TextStyle(color: Colors.grey)),
              validator: (value) {
                final pattern =
                    r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                final regExp = RegExp(pattern);

                if (value!.isEmpty) {
                  return '入力してください';
                } else if (!regExp.hasMatch(value)) {
                  return '無効なメールアドレスです';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            )
          ],
        ),
      );

  Widget contentTextField(
          {required String title,
          required String hint,
          required Icon icon,
          required TextEditingController controller,
          int maxLines = 5}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),
            TextFormField(
              controller: controller,
              maxLines: maxLines,
              validator: (value) {
                if (value!.isEmpty) {
                  return '入力してください';
                }
              },
              decoration: InputDecoration(
                prefixIcon: icon,
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      );
}

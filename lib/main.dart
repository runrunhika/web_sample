import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/new_model.dart';
import 'package:web_sample/screen/add/add_new_page.dart';
import 'package:web_sample/screen/controller/controller_acsec_page.dart';
import 'package:web_sample/screen/pages/saka_page.dart';
import 'package:web_sample/screen/pages/korona_page.dart';

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewModel>(
      create: (_) => NewModel(),
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text("掲示板ライトスタンド"),
            actions: [
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (ctx) => ContAc()));
                  })
            ],
          ),
          body: ListView(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(
                            "スレッド",
                            style:
                                TextStyle(color: Colors.grey.withOpacity(.5)),
                          ),
                          subtitle: Text(
                            "コロナ速報",
                            style: TextStyle(
                                fontSize: 30,
                                decoration: TextDecoration.underline,
                                color: Colors.black),
                          ),
                          leading: Icon(
                            Icons.arrow_circle_up,
                            color: Colors.red,
                          ),
                        )),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => MainPage()));
                  },
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: InkWell(
                  child: Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(
                            "スレッド",
                            style:
                                TextStyle(color: Colors.grey.withOpacity(.5)),
                          ),
                          subtitle: Text(
                            "お茶の間（情報交換）",
                            style: TextStyle(
                                fontSize: 30,
                                decoration: TextDecoration.underline,
                                color: Colors.black),
                          ),
                          leading: Icon(
                            Icons.arrow_circle_up,
                            color: Colors.red,
                          ),
                        )),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => SakaPage()));
                  },
                ),
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
          floatingActionButton:
              Consumer<NewModel>(builder: (context, model, child) {
            return FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => AddNewPage(model)));
              },
              label: const Text('スレッド追加要求'),
              icon: const Icon(Icons.mail),
              backgroundColor: Colors.blue,
            );
          })),
    );
  }
}

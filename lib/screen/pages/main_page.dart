import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/model/new_model.dart';
import 'package:web_sample/screen/add/add_new_page.dart';

import 'korona_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewModel>(
      create: (_) => NewModel(),
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text("レスバト"),
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
                        MaterialPageRoute(builder: (ctx) => KoronaPage()));
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_sample/main.dart';
import 'package:web_sample/model/korona_model.dart';

import '../add/add_korona_page.dart';
import 'main_page.dart';

class KoronaPage extends StatefulWidget {
  @override
  _KoronaPageState createState() => _KoronaPageState();
}

class _KoronaPageState extends State<KoronaPage> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KoronaModel>(
      create: (_) => KoronaModel()..getKoronaListRealtime(),
      child: Scaffold(
        appBar: AppBar(
            title: Text('コロナ速報'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => MainPage()));
              },
            )),
        body: Consumer<KoronaModel>(
          builder: (context, model, child) {
            final koronaList = model.koronaList;
            final listTiles = koronaList
                .map((book) => Container(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              book.name.isEmpty
                                  ? '名無し : ' + book.createdAt.toString()
                                  : book.name +
                                      ' : ' +
                                      book.createdAt.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.5)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                                book.imageURL.isEmpty
                                    ? SizedBox()
                                    : Image.network(book.imageURL, fit: BoxFit.cover,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<KoronaModel>(builder: (context, model, child) {
          return FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddKoronaPage(model),
                  fullscreenDialog: true,
                ),
              );
              model.getKoronaListRealtime();
            },
            label: const Text('投稿する'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.pink,
          );
        }),
      ),
    );
  }
}

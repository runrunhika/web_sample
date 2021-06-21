import 'package:flutter/material.dart';
import 'package:web_sample/screen/controller/controller_page.dart';

class ContAc extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("管理者のみアクセス権あり"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (controller.text != "1942091") {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('gm ks usero'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ControllerPage()));
                }
              }),
        ],
      ),
    );
  }
}

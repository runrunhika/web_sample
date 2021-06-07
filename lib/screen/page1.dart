import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Text("本名：　井上ゆうじ\n通名：　ゴミ\n経歴：　16年間いじめられる（しぶとい） \n生きる価値メーター：　0.22（ちなみに、世界のゴミの中でもリサイクル絶対不可能なゴミの割合と同数） \n補足：　レペゼンを乗っ取ったH氏と友達"),),
    );
  }
}
import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rock Band',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      getPages: [GetPage(name: '/mainPage', page: () => MainPage())],
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final itemKey = GlobalKey();
  final controller = CarouselController();
  int activeIndex = 0;
  final urlImages = ['assets/co.png', 'assets/dialog1.png', 'assets/co2.png'];

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'adGhT_-JbZI',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  YoutubePlayerController _controller2 = YoutubePlayerController(
    initialVideoId: 'sSHkXxADtaE',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  Future scrollToItem() async {
    final context = itemKey.currentContext;

    await Scrollable.ensureVisible(context!,
        alignment: 0.5, duration: Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              AlertDialog(
                backgroundColor: Colors.black,
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                              child: Image.asset(
                            'assets/dialog1.png',
                            width: 200,
                            height: 200,
                          )),
                          Text(
                            'New Release\n『君が食べた野良ニワトリ』',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ))
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 15,
          title: Text(
            'THE PIPES',
            style: TextStyle(
              fontFamily: 'MonteCarlo',
              fontSize: 31,
            ),
          ),
          centerTitle: true,
        ),
        endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Drawer(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'THE PIPES',
                      style: TextStyle(
                          fontFamily: 'MonteCarlo',
                          fontSize: 31,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    trailing: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 50,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'NEWS',
                      style: TextStyle(fontSize: 31, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'LIVE',
                      style: TextStyle(fontSize: 31, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'BIO',
                      style: TextStyle(fontSize: 31, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'DISC',
                      style: TextStyle(fontSize: 31, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'MOVIE',
                      style: TextStyle(fontSize: 31, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'GOODS',
                      style: TextStyle(fontSize: 31, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
              scrollbarTheme: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  // trackBorderColor: MaterialStateProperty.all(Colors.green),
                  trackColor: MaterialStateProperty.all(Colors.red))),
          child: Scrollbar(
            isAlwaysShown: true,
            showTrackOnHover: true,
            hoverThickness: 20,
            thickness: 10,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    key: itemKey,
                    child: Image.asset(
                      'assets/co2.png',
                      fit: BoxFit.contain,
                      width: 400,
                      height: 400,
                    ),
                  ),
                  CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: urlImages.length,
                    options: CarouselOptions(
                        height: 100,
                        initialPage: 0,
                        autoPlay: true,
                        reverse: false,
                        autoPlayAnimationDuration: Duration(milliseconds: 700),
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        }),
                    itemBuilder: (ctx, index, realIndex) {
                      final urlImage = urlImages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: buildImage(urlImage, index),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.youtube),
                        color: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.twitter),
                          color: Colors.white),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.facebook,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.instagram,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.amazon,
                              color: Colors.white)),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                              height: 34,
                              width: 60,
                              child: VerticalDivider(
                                color: Colors.pink,
                                thickness: 7,
                              )),
                          Text(
                            'NEWS',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '2021/08/05',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        subtitle: Text(
                          'Kotaro死去',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '2021/08/05',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        subtitle: Text(
                          'Shota死去',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '2021/08/05',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        subtitle: Text(
                          'The Pipes 改名',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                              height: 34,
                              width: 60,
                              child: VerticalDivider(
                                color: Colors.pink,
                                thickness: 7,
                              )),
                          Text(
                            'LIVE',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '開催日: 2021/08/21',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          '武道館',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '開催日: 2021/08/21',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          '埼玉アリーナ',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '開催日: 2021/08/21',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          'ハチ公前',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                              height: 68,
                              width: 60,
                              child: VerticalDivider(
                                color: Colors.pink,
                                thickness: 7,
                              )),
                          Text(
                            'STORYTELLER\nINFO',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '公開日: 2021/08/21',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          'Kotaroにかかと落とし',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '公開日: 2021/08/21',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          'The Pipes結成秘話',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '2021/08/05',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        subtitle: Text(
                          'Update to BLOG',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '2021/08/05',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        subtitle: Text(
                          'Update to BLOG',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Card(
                      color: Colors.grey.withOpacity(.2),
                      elevation: 25,
                      child: ListTile(
                        title: Text(
                          '2021/08/05',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        subtitle: Text(
                          'Update to BLOG',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                              height: 68,
                              width: 60,
                              child: VerticalDivider(
                                color: Colors.pink,
                                thickness: 7,
                              )),
                          Text(
                            'STORYTELLER\nMENU',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(120),
                            topRight: Radius.circular(120)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'BLOG',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(120),
                            topLeft: Radius.circular(120)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'GOODS',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(120),
                            topRight: Radius.circular(120)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'MOVIE',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(120),
                            topLeft: Radius.circular(120)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'TICKET',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      child: YoutubePlayerControllerProvider(
                        controller: _controller,
                        child: YoutubePlayerIFrame(
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      child: YoutubePlayerControllerProvider(
                        controller: _controller2,
                        child: YoutubePlayerIFrame(
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: ElevatedButton(
                            onPressed: scrollToItem, child: Text('PAGE TOP')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'THE PIPES',
                            style: TextStyle(
                                fontFamily: 'MonteCarlo',
                                fontSize: 51,
                                color: Colors.white),
                          ),
                          Text(
                            'THE PIPES',
                            style: TextStyle(fontSize: 21, color: Colors.white),
                          ),
                          Text(
                            '掲載されているすべてのコンテンツ\n記事、画像，音声データ、映像データの無断転載を固く禁じます。',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Image.asset(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }

  void animateToSlide(int index) => controller.animateToPage(index);
}

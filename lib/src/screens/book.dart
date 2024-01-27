import 'dart:async';
import 'dart:ui';
import 'package:doors/src/controller/main_controller.dart';
import 'package:doors/src/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Book extends StatefulWidget {
  final index;
  Book(this.index);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  MainController _mainController = Get.put(MainController());
  double height = 0.0;
  double width = 0.0;
  String image = "book";
  bool vis = false;
  Timer? timer;
  bool showTop = true;
  bool showBot = true;
  ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    // Check if the scroll position is at the top
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        showTop = false;
      });
    } else {
      setState(() {
        showTop = true;
      });
    }

    // Check if the scroll position is at the bottom
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        showBot = false;
      });
    } else {
      setState(() {
        showBot = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    Timer(Duration(seconds: 3), () {
      setState(() {
        vis = !vis;
      });
    });
    Timer(Duration(seconds: 10), () {
      timer = Timer.periodic(Duration(seconds: 20), (Timer t) => loop());
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 2500),
              opacity: vis ? 1 : 0,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken),
                      image: AssetImage('assets/images/$image.jpg'),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Undying Thought",
                              textAlign: TextAlign.center,
                              style: Fonts.tangerineBold(
                                  60, Color(0XFFFFFF00).withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() => Container(
                                  width: width / 1.05,
                                  child: Text(
                                    "  " +
                                        _mainController.data[0]['content']
                                            .toString() +
                                        "                                            ",
                                    textAlign: TextAlign.center,
                                    style: Fonts.tangerine(35, Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  (showTop)
                      ? Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Color(0x00000000),
                                Color(0xff000000).withOpacity(0.6)
                              ],
                              stops: [0.25, 0.75],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
                          ))
                      : Container(),
                  Expanded(flex: 3, child: Container()),
                  (showBot)
                      ? Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Color(0xff000000).withOpacity(0.6),
                                Color(0x00000000),
                              ],
                              stops: [0.25, 0.75],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
                          ))
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  loop() {
    print("Timer Starts");
    setState(() {
      vis = !vis;
    });
    Timer(Duration(seconds: 3), () {
      changeimage();
      setState(() {
        vis = !vis;
      });
    });
  }

  changeimage() {
    if (image == 'book') {
      image = 'book1';
    } else if (image == 'book1') {
      image = 'book2';
    } else if (image == 'book2') {
      image = 'book3';
    } else if (image == 'book3') {
      image = 'book4';
    } else if (image == 'book4') {
      image = 'book5';
    } else if (image == 'book5') {
      image = 'book6';
    } else if (image == 'book6') {
      image = 'book7';
    } else if (image == 'book7') {
      image = 'book8';
    } else if (image == 'book8') {
      image = 'book9';
    } else if (image == 'book9') {
      image = 'book10';
    } else if (image == 'book10') {
      image = 'book11';
    } else if (image == 'book11') {
      image = 'book12';
    } else if (image == 'book12') {
      image = 'book';
    }
  }
}

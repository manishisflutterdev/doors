import 'dart:async';

import 'package:doors/src/controller/main_controller.dart';
import 'package:doors/src/fonts/fonts.dart';
import 'package:doors/src/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MainController _mainController = Get.put(MainController());
  double height = 0.0;
  double width = 0.0;
  bool vis1 = false;
  bool vis2 = false;
  bool vis3 = false;
  bool vis = false;

  fetch() async{
    // var res = await _mainController.fetch();
    // if(res['result']=='success'){
      
    // }
    Timer(Duration(seconds: 2), (){
      setState(() {
        vis=true;
      });
      Timer(Duration(seconds: 4), (){
        timer();
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
   width = MediaQuery.of(context).size.width;
   height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 2500),
                    opacity: vis ? 1 : 0,
        child: Container(
          height: height,
          width: width,
          decoration:BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
              image: AssetImage('assets/images/splash1.jpg'),
              fit: BoxFit.fill
            ),
          ),
          child: (vis==false)
          ?
          Container()
          :
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width/1.2,
                child: Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: vis1 ? 1 : 0,
                    child: Text(
                      // _mainController.data[0]['first'].toString(),
                      'first is wind',
                    textAlign: TextAlign.center,
                    style: Fonts.lobster(50, Colors.white),),
                  ))),
              
              Container(
                width: width/1.2,
                child: Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: vis2 ? 1 : 0,
                    child: Text(
                      // _mainController.data[0]['second'].toString(),
                      'Second was the Amber',
                    textAlign: TextAlign.center,
                    style: Fonts.lobster(50, Colors.white),),
                  ))),
              
              Container(
                width: width/1.2,
                child: Center(
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: vis3 ? 1 : 0,
                    child: Text(
                      // _mainController.data[0]['third'].toString(),
                      'only Ash was left at last',
                    textAlign: TextAlign.center,
                    style: Fonts.lobster(50, Colors.white),),
                  )))
            ],
          ),
        ),
      ),
    );
  }

  timer(){
     Timer(Duration(seconds: 2), (){
          setState(() {
            vis1= !vis1;
          });
          Timer(Duration(seconds: 2), (){
          setState(() {
            vis1= !vis1;
          });
          Timer(Duration(seconds: 2), (){
          setState(() {
            vis2= !vis2;
          });
          Timer(Duration(seconds: 2), (){
          setState(() {
            vis2= !vis2;
          });
          Timer(Duration(seconds: 2), (){
          setState(() {
            vis3= !vis3;
          });
          Timer(Duration(seconds: 2), (){
          setState(() {
            vis3= !vis3;
          });
          Timer(Duration(seconds: 2), (){
            setState(() {
              vis = !vis;
            });
            Timer(Duration(seconds:2), (){
              Get.offAll(()=>Homepage());
            });
          });
        });
        });
        });
        });
        });
        });
  }
}
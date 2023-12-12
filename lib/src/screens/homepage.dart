import 'dart:async';

import 'package:doors/src/controller/main_controller.dart';
import 'package:doors/src/fonts/fonts.dart';
import 'package:doors/src/screens/book.dart';
import 'package:doors/src/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  MainController _mainController = Get.put(MainController());
  double height = 0.0;
  double width = 0.0;
  bool vis = false;
  TextEditingController _textField = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      setState(() {
        vis=true;
      });
    });
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
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
              image: AssetImage('assets/images/homepage.jpg'),
              fit: BoxFit.fitHeight
            ),
          ),
          child: Column(
            children: [
              
             SizedBox(height: 60,),
             Text("Parts of me".toString(),
                    textAlign: TextAlign.center,
                    style: Fonts.puppies(60, Colors.white),),
             ListView.builder(
               shrinkWrap: true,
               itemCount: _mainController.data.length,
               itemBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.symmetric(vertical:8.0),
                 child: ListTile(
                   onTap: (){
                     Get.to(()=>Book(index));
                   },
                   title: Text("Undying Thought".toString(),style: Fonts.akebono(22, Colors.white),),
                   subtitle: Text("Some ways to within",style: Fonts.akebono(13, Colors.white.withOpacity(0.5)),),
                   leading: CircleAvatar(
                           radius: 40,
                           backgroundImage: NetworkImage("assets/images/book1.jpg"), // no matter how big it is, it won't overflow
                        ),
                   trailing: Icon(Icons.navigate_next,color: Colors.white,size: 30,)
                 ),
               );
             })
                  
            ],
          ),
        ),
      ),
    );
  }

}
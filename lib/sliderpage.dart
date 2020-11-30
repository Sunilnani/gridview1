import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app40/LoginRegisterPage.dart';
class sliderpage extends StatefulWidget {
  @override
  _sliderpageState createState() => _sliderpageState();
}

class _sliderpageState extends State<sliderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:EdgeInsets.fromLTRB(5,40,5, 5) ,
            width: double.infinity,
            height: 400,
            child: Carousel(
            showIndicator: false,
            animationDuration: Duration(milliseconds: 600),
            images: [
              AssetImage('img/fresh1.png'),
              AssetImage('img/delivery.jpg'),
              AssetImage('img/secure2.png')
            ],
            ),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            showDialog(context: context,barrierDismissible: false,
            builder: (BuildContext){
              return Center(
                child: Opacity(opacity: 1.0,
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.orangeAccent),
                ),),
              );
            });
          Timer(Duration(seconds: 3), () =>Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegisterPage())));
          },
          label: Text('Start'),
        icon: Icon(Icons.arrow_right),
      backgroundColor: Colors.orangeAccent,
      elevation: 10),
    );
  }
}

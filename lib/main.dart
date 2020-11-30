import 'package:flutter/material.dart';

import 'list.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  List <String> Texts = ["first" , "Second","third" , "four","five" , "six","seven","eight"];
  List <Color> colors = [Colors.orangeAccent ,Colors.yellow ,Colors.red ,Colors.green,Colors.white,Colors.deepOrange,Colors.redAccent,Colors.cyanAccent,];

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Grid View Example')),
      ),
      body: new GridView.count(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        children:  List<Widget>.generate(Texts.length, (int index) {
            return Card(
              color: colors[index],
              child: Center(child: Text(Texts[index])),
            );
        }),
      ),
    );
  }
}
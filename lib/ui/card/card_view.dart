import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget{

  @override
  _CardState createState()=> new _CardState();


}

class _CardState extends State<CardView>{
  @override
  Widget build(BuildContext context) {
    print(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Card view'),
      )
    );
  }
}
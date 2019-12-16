import 'dart:math';

import 'package:flutter/material.dart';

const String _name = 'kundan kishore';
class ChatMessage extends StatelessWidget {
  String text;

  ChatMessage({this.text});

  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.blue, Colors.greenAccent, Colors.deepOrange];
  Random random = new Random();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    index = random.nextInt(6);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name,style: Theme.of(context).textTheme.subhead,),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text, style: TextStyle(color: colors[index]),),
              )
            ],
          )
        ],
      ),
    );
  }
}

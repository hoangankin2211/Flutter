// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Object answerString;
  final Function() selectHandler;

  Answer(this.answerString, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      // ignore: prefer_const_constructors
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: selectHandler,
        color: Colors.blue,
        child: Text(answerString.toString()),
      ),
    );
  }
}

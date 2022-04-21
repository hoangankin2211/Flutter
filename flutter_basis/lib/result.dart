// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetQuiz;

  Result(@required this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it !!!';
    if (resultScore <= 8) {
      resultText =
          'Your score is $resultScore and  you are awesome and innocent !';
    } else if (resultScore <= 12) {
      resultText = 'Your score is $resultScore and you are pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'Your score is $resultScore and you are ... strange?!';
    } else {
      resultText = 'Your score is $resultScore and you are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetQuiz, child: Text('Restart Quiz !'))
        ],
      ),
    );
  }
}

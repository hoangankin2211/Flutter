// ignore_for_file: deprecated_member_use, invalid_required_positional_param, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> listQuestions;
  final int questionIndex;
  final Function(int) answerQuestion;
  final Function() UpperCase;
  final Function() LowerCase;

  Quiz(
      {required this.answerQuestion,
      required this.listQuestions,
      required this.questionIndex,
      required this.LowerCase,
      required this.UpperCase});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Question(listQuestions[questionIndex]['questionText'] as String),
        ...(listQuestions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) => Answer(answer['text'] as Object,
                () => answerQuestion(answer['score'] as int)))
            .toList(),
        RaisedButton(
          child: Text("Upper Case"),
          onPressed: UpperCase,
        ),
        RaisedButton(
          child: Text("Lower Case"),
          onPressed: LowerCase,
        )
      ],
    );
  }
}

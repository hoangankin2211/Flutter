// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names

import 'dart:ffi';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
  late final String test;
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  final List<Map<String, Object>> listQuestions = [
    {
      'questionText': 'What\'s your name?',
      'answer': [
        {'text': 'Hoang', 'score': 10},
        {'text': 'Hai', 'score': 9},
        {'text': 'Tien', 'score': 8},
        {'text': 'Hung', 'score': 7}
      ]
    },
    {
      'questionText': 'Where are you live?',
      'answer': [
        {'text': 'Gia Lai', 'score': 10},
        {'text': 'Hung Yen', 'score': 8},
        {'text': 'Binh Dinh', 'score': 7},
        {'text': 'Da Nang', 'score': 9}
      ]
    },
    {
      'questionText': 'How old are you?',
      'answer': [
        {'text': 12, 'score': 10},
        {'text': 22, 'score': 9},
        {'text': 23, 'score': 8},
        {'text': 44, 'score': 10}
      ]
    },
    {
      'questionText': 'How many member of your family?',
      'answer': [
        {'text': 1, 'score': 10},
        {'text': 2, 'score': 9},
        {'text': 3, 'score': 8},
        {'text': 4, 'score': 7}
      ]
    }
  ];
  int totalScore = 0;
  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      ++questionIndex;
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  void UpperCase() {
    setState(() {
      listQuestions[questionIndex]['questionText'] =
          listQuestions[questionIndex]['questionText'].toString().toUpperCase();
    });
  }

  void LowerCase() {
    setState(() {
      listQuestions[questionIndex]['questionText'] =
          listQuestions[questionIndex]['questionText'].toString().toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Questions List')),
        body: questionIndex < listQuestions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                listQuestions: listQuestions,
                questionIndex: questionIndex,
                LowerCase: LowerCase,
                UpperCase: UpperCase)
            : Result(totalScore, _resetQuiz),
      ),
    );
  }
}

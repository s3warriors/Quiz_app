import 'package:flutter/material.dart';
// import './questions.dart'; //import question file
// import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _totalscore = 0;
  void _answer(int score) {
    _totalscore += score;
    setState(() {
      _qindex++;
    });

    if (_qindex < _questions.length) {
      print('there are more question available');
    } else {
      print('no more questions');
    }

    print(_qindex);
    print('answer choosen');
  }

  void _reset() {
    setState(() {
    _totalscore = 0;
    _qindex=0;
      
    });
  }

  var _qindex = 0;

  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: (_qindex < _questions.length)
            ? Quiz(
                questions: _questions,
                qindex: _qindex,
                answerQuestion: _answer,
              )
            : Result(_totalscore,_reset),
      ),
    );
  }
}

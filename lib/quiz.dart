import 'package:flutter/material.dart';
import 'answer.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int qindex;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.qindex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          questions[qindex]['questionText'].toString(),
        ),
        ...(questions[qindex]['answers'] as List<Map<String, Object>>)
            .map((element) {
          return answer(() => answerQuestion(element['score']),
              (element['text'] as String));
        }).toList()
      ],
    );
  }
}

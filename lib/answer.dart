//lec43

import 'package:flutter/material.dart';

class answer extends StatelessWidget {
  final selecthandler;
  final String answertext;
  answer(this.selecthandler,this.answertext);
  @override


  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: selecthandler, 
      child:Text(answertext ),
      // style: ButtonStyle(backgroundColor: MaterialStateProperty.(Colors.black)),
      ),
 
    );
  }
}

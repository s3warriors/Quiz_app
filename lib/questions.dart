
//lec39_40

import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String
      questionText; //final means this string value cant be chnged after intialization
  Questions(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
  
        textAlign: TextAlign.center,
      ),
    );
  }
}

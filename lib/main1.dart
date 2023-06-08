import 'package:flutter/material.dart';
import './questions.dart'; //import question file
import 'answer.dart';
// import 'quiz.dart';
// void main() {
//   runApp(MyApp());
// }

// or there is a shortcut method for instruction function
void main() => runApp(MyApp());

//[
// class MyApp extends StatelessWidget {
//   //starting lec25 building an app

//   void answer() {
//     //lec32
//     qindex++;
//     print(qindex);
//     print('answer choosen');
//   }

//   var qindex = 0; //lec34

//   @override //decorator provided by dart   lec28
//   Widget build(BuildContext context) {
//     //
//     var questions = ['what\'s your name ', 'what is your age']; //list

//     return MaterialApp(
//       home: Scaffold(
//         //lec29 building a widget tree
//         appBar: AppBar(
//           title: Text('my first app'),
//           backgroundColor: Color.fromARGB(255, 6, 40, 45),
//         ),
//         // body: Text('this is my first app'),//here we have only one text widget so we need list here

//         // backgroundColor: Color.fromARGB(255, 77, 116, 131),

// //lec31 adding layout widget
//         // body: Column(  //align everything above each other
//         //   children: [
//         //     Text('the questions'),
//         //     ElevatedButton(onPressed: null, child: Text('answer1')),
//         //     ElevatedButton(onPressed: null, child: Text('answer2')),
//         //   ],
//         // ),

//         // body: Row(   //align everything next to each other
//         //   children: [
//         //     Text('the questions'),
//         //     ElevatedButton(onPressed: null, child: Text('answer1')),
//         //     ElevatedButton(onPressed: null, child: Text('answer2')),
//         //   ],
//         // ),

// //lec32 connecting function and buttons
//         body: Column(
//           //align everything above each other
//           // children: [
//           //   Text('the questions'),

//           //   ElevatedButton(
//           //       onPressed: answer,
//           //       child: Text(
//           //           'answer1')), //why not answer()=>beacuse we want to run this function when we press that button so we have passed name pointer here not its return value

// //lec33 anonymous function
//           // ElevatedButton(
//           //     onPressed: () {
//           //       print('answer 2 chosen');
//           //     },
//           //     child: Text('answer2')),

//           // ElevatedButton(
//           //     onPressed: () => print('answer 3 chosen'),
//           //     child: Text('answer3')),

// // lec34 updating widget data
//           children: [
//             Text(questions[qindex]),   //or we can use questions.elementAt(0)
//             ElevatedButton(
//               onPressed: answer,
//               child: Text('answer1'),

//             ),

//             ElevatedButton(
//                 onPressed: () {
//                   print('answer 2 chosen');
//                 },
//                 child: Text('answer2')),
//             ElevatedButton(
//                 onPressed: () => print('answer 3 chosen'),
//                 child: Text('answer3')),
//           ],

//         ),
//       ),
//     );
//   }
// }
//]

//lec36  stateful widget  ....below i m using some previous code   //lec38 _ using this we can add private properties to a method,class,var so they cant be used anywhere else except this file
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //createstate is a method which takes no arguments and return state connected to a  stateful widget

    // implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void _answer() {
    setState(() {
      //this is a function which take function as argument  lec37
      _qindex++;
    });

    //lec47 introducing if statement
    if (_qindex < _questions.length) {
      print('there are more question available');
    }
    else {
      print('no more questions');
    }
    
    print(_qindex);
    print('answer choosen');
  }

  var _qindex = 0; //lec34

  //lec44 now we r updating this list of text to a  map

  // var _questions = ['what\'s your name ', 'what is your age']; //list
  // {
  var _questions = [
    {
      'questiontext': 'what\'s your fav color',
      'ans': ['black', 'blue', 'red', 'yellow']
    },
    {
      'questiontext': 'what\'s your fav animal',
      'ans': ['a', 'b', 'c', 'd']
    },
    {
      'questiontext': 'what\'s your fav car',
      'ans': ['r', 'be', 'd', 'ow']
    },
  ];
  // }

  @override //decorator provided by dart   lec28
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: (_qindex < _questions.length)?
        // //lec 50 ternary operator
      
      
      
       //lec51 spilitting into widgets basically we want to remove this column and try to implement this in different file
            // ?Quiz(questions: questions, answerQuestion: answerQuestion, qindex: qindex)
            
            
            
             Column(
          children: [
            Questions(
              //  _questions[_qindex]['questiontext'] as String
              _questions[_qindex]['questiontext'].toString(),
            ), //here we replced text with Question class

            // ElevatedButton(
            //   onPressed: _answer,
            //   child: Text('answer1'),
            // ),

            // ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         _qindex++;
            //       });
            //       print('answer 2 chosen');
            //     },
            //     child: Text('answer2')),

            // lec43 replacing elevated button with class answer
            // answer(_answer),
            // answer(_answer),
            // answer(_answer),
            // answer(_answer),

            ...(_questions[_qindex]['ans'] as List<String>).map((element) {
              return answer(_answer, element);
            }).toList()
          ],
        )



        : Center(   

                child: Text('you did it'),
              ),
//or
//add this in result file ---->   : Result(),  //lec51

      ),
    );
  }
}











//*********************************************************** */ after lec 54*******************************************************




/* import 'package:flutter/material.dart';
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

 */







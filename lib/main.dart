import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

///void main(){
// runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answer': [
        {'text': 'black', 'score': 3},
        {'text': 'blue', 'score': 11},
        {'text': 'green', 'score': 5},
        {'text': 'white', 'score': 2}
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'elephant', 'score': 5},
        {'text': 'rabbit', 'score': 3},
        {'text': 'lion', 'score': 9},
        {'text': 'snake', 'score': 11}
      ],
    },
    {
      'question': 'What\'s your favorite instructor?',
      'answer': [
        {'text':'Max', 'score': 1},
        {'text':'Max', 'score': 1},
        {'text':'Max', 'score': 1},
        {'text':'Max', 'score': 1},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {

    _questionIndex = 0;
    _totalScore = 0;
      
    });
  }

  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;


    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

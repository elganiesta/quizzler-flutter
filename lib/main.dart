import 'package:flutter/material.dart';
import 'package:quizzler/quizBrain.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

QuizBrain quizbrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  Icon checkAnswer(bool answerPicked) {
    bool correctAnswer = quizbrain.getQuestionAnswer();

    if (correctAnswer == answerPicked) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quizbrain.isFinished() == true) {
                    quizbrain.reset();
                    scoreKeeper = [];
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc: 'You\'ve reached the end of the quiz.',
                    ).show();
                  } else {
                    scoreKeeper.add(checkAnswer(true));
                    quizbrain.goToNextQuestion();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quizbrain.isFinished() == true) {
                    quizbrain.reset();
                    scoreKeeper = [];
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc: 'You\'ve reached the end of the quiz.',
                    ).show();
                  } else {
                    scoreKeeper.add(checkAnswer(false));
                    quizbrain.goToNextQuestion();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

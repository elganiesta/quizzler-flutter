import 'package:quizzler/question.dart';

class QuizBrain {

  int _questionNbr =0;

  List<Question> _quizBank = [
    Question('15/09/1999 is my birthday ',false),
    Question('game of thrones is my favorite serie ',false),
    Question('i like the dark ',true),
    Question('i love pizza ',false),
    Question('i would love to travel to NewYork',true),
  ];

  void goToNextQuestion() {
    if(_questionNbr < _quizBank.length -1 ) {
      _questionNbr++;
    }
  }

  bool isFinished() {
    if (_questionNbr >= _quizBank.length - 1) {

      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNbr = 0;
  }

  
  String getQuestionText() {
    return _quizBank[_questionNbr].questionText;
  }

  bool getQuestionAnswer() {
    return _quizBank[_questionNbr].questionAnswer;
  }
} 
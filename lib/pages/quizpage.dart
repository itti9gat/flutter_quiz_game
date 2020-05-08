import 'package:flutter/material.dart';
import 'package:flutter_quiz_game/models/question.dart';
import 'package:flutter_quiz_game/data/data.dart';
import 'package:flutter_quiz_game/pages/resultpage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  List<Question> questions = new List<Question>();

  int index = 0;
  int points = 0;

  AnimationController controller;
  Animation animation;

  double beginAnim = 0.0;
  double endAnim = 1.0;

  @override
  void initState() {
    super.initState();

    questions = getQuestions();

    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {
          // Change here any Animation object value.
        });
      });

    startProgress();

    animation.addStatusListener((AnimationStatus animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        if (index < questions.length - 1) {
          index++;
          resetProgress();
          startProgress();
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(
                        score: points,
                      )));
        }
      }
    });
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
      resetProgress();
      startProgress();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    score: points,
                  )));
    }
  }

  startProgress() {
    controller.forward();
  }

  stopProgress() {
    controller.stop();
  }

  resetProgress() {
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.cyan,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.0,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                    value: animation.value,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quesion ${index + 1} of ${questions.length}",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "$points Point",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  questions[index].getQuestion(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                getCardAnswer(questions[index], 0),
                getCardAnswer(questions[index], 1),
                getCardAnswer(questions[index], 2),
                getCardAnswer(questions[index], 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCardAnswer(Question ques, int idx) {
    String cardAnswer;

    if (idx == 0) {
      cardAnswer = ques.getAnswerA();
    } else if (idx == 1) {
      cardAnswer = ques.getAnswerB();
    } else if (idx == 2) {
      cardAnswer = ques.getAnswerC();
    } else if (idx == 3) {
      cardAnswer = ques.getAnswerD();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45.0,
        child: RaisedButton(
          onPressed: () {
            if (ques.getAnswer() == idx) {
              setState(() {
                points = points + 10;
              });
            }
            nextQuestion();
          },
          elevation: 5.0,
          color: Colors.white,
          child: Text(
            cardAnswer,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

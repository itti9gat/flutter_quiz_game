import 'package:flutter/material.dart';
import 'package:flutter_quiz_game/pages/quizpage.dart';

class ResultPage extends StatefulWidget {
  final int score;

  ResultPage({this.score});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(
                "SCORE",
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                "${widget.score}",
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(
                height: 100.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QuizPage()));
                },
                color: Colors.blue,
                child: Text("Play Again"),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

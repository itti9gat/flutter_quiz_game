import 'package:flutter/material.dart';
import 'package:flutter_quiz_game/pages/quizpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => QuizPage()));
          },
          color: Colors.blue,
          child: Text("START QUIZ"),
        )),
      ),
    );
  }
}

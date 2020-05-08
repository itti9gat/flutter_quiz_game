import 'package:flutter_quiz_game/models/question.dart';

List<Question> getQuestions() {
  List<Question> questionList = new List<Question>();

  //1
  Question question = new Question();
  question.setQuestion("3 + 4");
  question.setAnswer(2);
  question.setAnswerA("3");
  question.setAnswerB("5");
  question.setAnswerC("7");
  question.setAnswerD("9");
  questionList.add(question);

  //2
  question = new Question();
  question.setQuestion("12 x 7");
  question.setAnswer(3);
  question.setAnswerA("54");
  question.setAnswerB("64");
  question.setAnswerC("74");
  question.setAnswerD("84");
  questionList.add(question);

  //3
  question = new Question();
  question.setQuestion("12 + 4 / 2");
  question.setAnswer(3);
  question.setAnswerA("8");
  question.setAnswerB("10");
  question.setAnswerC("12");
  question.setAnswerD("14");
  questionList.add(question);
  
  return questionList;
}

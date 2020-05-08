class Question {
  String question;
  int answer;
  String answerA;
  String answerB;
  String answerC;
  String answerD;

  Question({this.question, this.answer});

  void setQuestion(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(int getAnswer) {
    answer = getAnswer;
  }

  void setAnswerA(String getAnswer) {
    answerA = getAnswer;
  }

  void setAnswerB(String getAnswer) {
    answerB = getAnswer;
  }

  void setAnswerC(String getAnswer) {
    answerC = getAnswer;
  }

  void setAnswerD(String getAnswer) {
    answerD = getAnswer;
  }

  String getQuestion() {
    return question;
  }

  int getAnswer() {
    return answer;
  }

  String getAnswerA() {
    return answerA;
  }

  String getAnswerB() {
    return answerB;
  }

  String getAnswerC() {
    return answerC;
  }

  String getAnswerD() {
    return answerD;
  }
}

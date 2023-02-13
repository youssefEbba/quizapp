import 'package:flutter/cupertino.dart';

import '../services/quizservices.dart';

class Quiz extends ChangeNotifier {
  dynamic quizzs = [];
  QuizRepo quizrepo = QuizRepo();
 
  bool loading = false;
  getQuiz(String cat) async {
    loading = true;
    quizzs = await quizrepo.getQuizs(cat);
   
    loading = false;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:quizz/services/questionservices.dart';

class QuestionProvider extends ChangeNotifier {
  dynamic questions = [];
  int _indexquestion = 0;
  bool loading = false;
  int get indexquestion => _indexquestion;
  setIndexquestion(int val) {
    _indexquestion = val;
    notifyListeners();
  }

  // PageController controller = PageController();

  // void nextPage() async {
  //   await controller.nextPage(
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeOut,
  //   );
  // }

  QuestionRepo questionRepo = QuestionRepo();
  getQuiz(String quiz) async {
    loading = true;
    questions = await questionRepo.getQuestions(quiz);
    loading = false;
    notifyListeners();
  }
}

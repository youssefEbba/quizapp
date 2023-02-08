
import 'package:flutter/cupertino.dart';
import 'package:quizz/services/questionservices.dart';

class QuestionProvider extends ChangeNotifier {
  dynamic questions = [];
  int indexquestion = 0;
  bool loading = false;

  final PageController controller = PageController();
  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }


  QuestionRepo questionRepo = QuestionRepo();
  getQuiz(String quiz) async {
    loading = true;
    questions = await questionRepo.getQuestions(quiz);
    loading = false;
    notifyListeners();
  }
  


}

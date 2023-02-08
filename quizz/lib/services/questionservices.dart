import 'package:quizz/services/networkservices.dart';
import '../utile/urlsapi.dart';

class QuestionRepo {
  final BaseApiService apiServices = NetworkApiService();
  dynamic quizs = [];

  Future<dynamic> getQuestions(String quiz) async {
    try {
      dynamic response =
          await apiServices.getApiResponse(AppUrl.questions + quiz, quizs);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

import '../utile/urlsapi.dart';
import 'networkservices.dart';

class QuizRepo {
  final BaseApiService apiServices = NetworkApiService();
  dynamic quizs = [];
  
  Future<dynamic> getQuizs(String categorie ) async {
    try {
      
      dynamic response = await apiServices.getApiResponse(AppUrl.quizs+categorie , quizs);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

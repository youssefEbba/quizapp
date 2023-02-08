import 'package:quizz/services/networkservices.dart';
import 'package:quizz/utile/urlsapi.dart';

class ParticpationRepo {
  final BaseApiService apiServices = NetworkApiService();

  Future<dynamic> postParticipation(dynamic data) async {
    try {
      dynamic resp = await apiServices.getPostApiResponse(AppUrl.participation, data);
      return resp;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:quizz/services/networkservices.dart';
import 'package:quizz/utile/urlsapi.dart';

class ParticpationRepo {
  final BaseApiService apiServices = NetworkApiService();
  dynamic particps = [];
  Future<dynamic> postParticipation(dynamic data) async {
    try {
      dynamic resp =
          await apiServices.getPostApiResponse(AppUrl.participation, data);
      return resp;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getParticipations(String user) async {
    try {
      dynamic response =
          await apiServices.getApiResponse(AppUrl.partiuser + user, particps);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

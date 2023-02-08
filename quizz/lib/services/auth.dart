// ignore_for_file: unused_local_variable, avoid_print


import '../utile/urlsapi.dart';
import 'networkservices.dart';

class AuthRepository {
  final NetworkApiService apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.login, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.register, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

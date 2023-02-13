import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

abstract class BaseApiService {
  Future<dynamic> getApiResponse(String url, dynamic data);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> get(String url);
}

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url, dynamic data) async {
    dynamic reponseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 20));
      reponseJson = returnResponse(response);
    } on SocketException {
      throw FetachDataException("No Internet Connection");
    }
    return reponseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic reponseJson;
    try {
      Response response =
          await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
        "Accept": "application/json",
        "Acces-Control_Allow_Origin": "*",
        "content-type": "application/json"
      }).timeout(const Duration(seconds: 10));
      reponseJson = returnResponse(response);
    } on SocketException {
      throw FetachDataException("No Internet Connection");
    }
    return reponseJson;
  }

  @override
  Future get(String url) async {
    dynamic reponseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Acces-Control_Allow_Origin": "*",
        "content-type": "application/json"
      }).timeout(
        const Duration(seconds: 20),
      );
      reponseJson = returnResponse(response);
    } on SocketException {
      throw FetachDataException("No Internet Connection");
    }
    return reponseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        //throw UnauthorisedException(response.body.toString());
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:

      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetachDataException(
            "Error accured while communicating with serve with staus code${response.statusCode}");
    }
  }
}

class AppUrl {
  static const String baseUrl = 'http://192.168.43.94:8080/';

  static const String login = "${baseUrl}login/";
  static const String register = "${baseUrl}users/";
  static const String quizs = "${baseUrl}quizs/?categorie=";
  static const String questions = "${baseUrl}questions/?quiz=";
  static const String participation = "${baseUrl}particpations/";
}

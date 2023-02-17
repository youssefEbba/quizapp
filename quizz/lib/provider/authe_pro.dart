// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:quizz/pages/login.dart';
import 'package:quizz/utile/Utill.dart';


import '../models/user.dart';
import '../pages/home.dart';

import '../services/auth.dart';
import '../services/networkservices.dart';
import '../utile/urlsapi.dart';
import 'UserViewModel.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();
  final net = NetworkApiService();
  bool _loading = false;
  bool get loading => _loading;
  UserModel? userModel;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  UserViewModel user = UserViewModel();
  final BaseApiService apiServices = NetworkApiService();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    dynamic response = await apiServices.getPostApiResponse(AppUrl.login, data);

    if (response['token'] == null) {
      _myRepo.loginApi(data).then((value) {
        setLoading(false);
        snackBar(context);
      });
    } else {
      _myRepo.loginApi(data).then((value) {
        setLoading(true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
        userModel = UserModel.fromJson(response);
        user.saveUser(userModel!);
      }).onError((error, stackTrace) {});
    }
  }

  Future<void> logout() async {
    userModel = null;
    setLoading(false);
    notifyListeners();
    user.remove(true);
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      setLoading(false);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}

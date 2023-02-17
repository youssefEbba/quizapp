// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

import 'UserViewModel.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  bool test = false;

  void checkAuthantication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == null || value.token == '') {
        test = true;
      } else {
        test = false;
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

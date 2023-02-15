// // ignore_for_file: use_build_context_synchronously, prefer_const_constructors

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';


// import '../models/user.dart';
// import '../pages/home.dart';
// import '../pages/login.dart';
// import 'UserViewModel.dart';


// class SplashServices {
//   Future<UserModel> getUserData() => UserViewModel().getUser();

//   void checkAuthantication(BuildContext context) async {
//     getUserData().then((value) async {
      
//       if (value.token == null || value.token == '') {
//         await Future.delayed(const Duration(seconds: 3));
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const Login()),
//         );
//       } else {
//         await Future.delayed(Duration(seconds: 3));
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeView()),
//         );
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
// }
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quizz/pages/home.dart';
import 'package:quizz/pages/login.dart';
import 'package:quizz/provider/UserViewModel.dart';

import 'package:quizz/provider/authe_pro.dart';
import 'package:quizz/provider/participationprovider.dart';
import 'package:quizz/provider/questionprovider.dart';
import 'package:quizz/provider/quizprovider.dart';
import 'package:quizz/provider/spalsh_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SplashServices().checkAuthantication(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => Quiz()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => Participation()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashServices().test ? const HomeView() : const Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

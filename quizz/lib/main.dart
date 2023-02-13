import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quizz/pages/login.dart';

import 'package:quizz/provider/authe_pro.dart';
import 'package:quizz/provider/participationprovider.dart';
import 'package:quizz/provider/questionprovider.dart';
import 'package:quizz/provider/quizprovider.dart';

void main() {
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => Quiz()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => Participation()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

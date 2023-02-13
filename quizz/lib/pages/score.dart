// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quizz/pages/home.dart';
import 'package:quizz/provider/authe_pro.dart';
import 'package:quizz/provider/participationprovider.dart';
import 'package:quizz/provider/questionprovider.dart';
import 'package:quizz/provider/quizprovider.dart';
import 'package:quizz/utile/Utill.dart';

class Score extends StatefulWidget {
  const Score(this.quiz, this.score, this.user, {Key? key}) : super(key: key);
  final String quiz;
  final int score;
  final String user;
  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  void initState() {
    super.initState();
    final Score = Provider.of<Participation>(context, listen: false);
    final questionmodel = Provider.of<QuestionProvider>(context, listen: false);
    Map data = {
      "score": widget.score,
      "user": widget.user,
      "quiz": widget.quiz,
    };
    Score.postParticip(data);
  }

  @override
  Widget build(BuildContext context) {
    final questionmodel = Provider.of<QuestionProvider>(context, listen: true);
    final usermodel = Provider.of<AuthViewModel>(context, listen: true);
    double resultat = widget.score / questionmodel.questions.length;
    resultat = resultat * 100;
    String pourcent = resultat.toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Application'),
      ),
      drawer: drawer(
          context, usermodel.userModel!.name, usermodel.userModel!.email),
      backgroundColor: Color.fromARGB(255, 191, 202, 192),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 150),
          child: Column(
            children: [
              Text(
                resultat > 0.5
                    ? 'Bravo '
                        '${usermodel.userModel!.name} votre score est \ : $pourcent% '
                    : '${usermodel.userModel!.name} votre score est \ : $pourcent% ',
                style: TextStyle(
                    fontSize: 40,
                    color: resultat > 0.5 ? Colors.green : Colors.redAccent),
              ),
              ElevatedButton(
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ))),
                  child: const Text('Essayer un autre quiz'))
            ],
          ),
        ),
      ),
    );
  }
}

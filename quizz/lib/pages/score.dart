// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:provider/provider.dart';
import 'package:quizz/pages/home.dart';
import 'package:quizz/provider/authe_pro.dart';
import 'package:quizz/provider/participationprovider.dart';
import 'package:quizz/provider/questionprovider.dart';
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
    //final questionmodel = Provider.of<QuestionProvider>(context, listen: false);
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
    final user = Provider.of<AuthViewModel>(context, listen: true);
    double resultat = widget.score / questionmodel.questions.length;
    String pourcent = (resultat * 100).toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Application'),
      ),
      drawer: drawer(
          context,
          user.userModel == null ? '' : user.userModel?.name,
          user.userModel == null ? '' : user.userModel?.email),
      backgroundColor: const Color.fromARGB(255, 191, 202, 192),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
          child: Column(
            children: [
              Text(
                resultat >= 0.5
                    ? 'Bravo '
                        '${user.userModel == null ? '' : user.userModel?.name} votre score est  : $pourcent% '
                    : '${user.userModel == null ? '' : user.userModel?.name} votre score est  : $pourcent% ',
                style: TextStyle(
                    fontSize: 40,
                    color: resultat > 0.5
                        ? Colors.green
                        : const Color.fromARGB(255, 236, 49, 35)),
              ),
              const SizedBox(
                height: 50,
              ),
              CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent: resultat,
                // ignore: unnecessary_new
                center: const Text(
                  "Score",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.red,
                progressColor: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                    onPressed: (() {
                      resultat = 0;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ));
                    }),
                    child: const Text('Essayer un autre quiz')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

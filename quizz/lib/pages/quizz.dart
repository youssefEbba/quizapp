// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:quizz/pages/score.dart';

import '../provider/authe_pro.dart';
import '../provider/questionprovider.dart';
import '../provider/quizprovider.dart';

class Quizz extends StatefulWidget {
  const Quizz(this.quiz, this.time, {Key? key}) : super(key: key);
  final String quiz;
  final int time;

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  @override
  void initState() {
    super.initState();
    final questionmodel = Provider.of<QuestionProvider>(context, listen: false);
    questionmodel.getQuiz(widget.quiz);
  }

  @override
  Widget build(BuildContext context) {
    final questionmodel = Provider.of<QuestionProvider>(context, listen: true);
    final user = Provider.of<AuthViewModel>(context, listen: true);
    int endTime =
        DateTime.now().millisecondsSinceEpoch + 1000 * widget.time * 60;
    int i = 1;
    void pagging(String quiz) {
      if (i == questionmodel.questions.length) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Score(quiz, 1, '')));
      } else {
        i = i + 1;
        questionmodel.nextPage();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.quiz),
            CountdownTimer(
              endTime: endTime,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blueGrey[100],
        padding: EdgeInsets.only(top: 50),
        child: PageView.builder(
            controller: questionmodel.controller,
            itemCount: questionmodel.questions.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Text(
                    questionmodel.questions[index]['question'],
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        pagging(questionmodel.questions[index]['quiz']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        width: 300,
                        height: 50,
                        child: Center(
                          child: Text(questionmodel.questions[index]['choix1'],
                              style: TextStyle(color: Colors.white)),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        pagging(questionmodel.questions[index]['quiz']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        width: 300,
                        height: 50,
                        child: Center(
                          child: Text(questionmodel.questions[index]['choix2'],
                              style: TextStyle(color: Colors.white)),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        pagging(questionmodel.questions[index]['quiz']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        width: 300,
                        height: 50,
                        child: Center(
                          child: Text(questionmodel.questions[index]['choix3'],
                              style: TextStyle(color: Colors.white)),
                        ),
                      ))
                ],
              );
            })),
      ),
    );
  }
}

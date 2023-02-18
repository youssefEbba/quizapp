// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quizz/pages/score.dart';
import 'package:quizz/provider/participationprovider.dart';

import '../provider/authe_pro.dart';

class Particpation extends StatefulWidget {
  const Particpation({Key? key}) : super(key: key);

  @override
  State<Particpation> createState() => _ParticpationState();
}

class _ParticpationState extends State<Particpation> {
  @override
  void initState() {
    final participation = Provider.of<Participation>(context, listen: false);
    final user = Provider.of<AuthViewModel>(context, listen: false);
    participation.getQuiz(user.userModel!.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final participation = Provider.of<Participation>(context, listen: true);
    // final user = Provider.of<AuthViewModel>(context, listen: true);
    //participation.getQuiz(user.userModel!.id.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vos Participations'),
      ),
      body: ListView.builder(
        itemCount: participation.participations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Text(participation.participations[index]['quiz'])],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor:
                            participation.participations[index]['score'] < 5
                                ? Colors.red
                                : Colors.green,
                        child: Text(participation.participations[index]['score']
                            .toString()))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quizz/provider/participationprovider.dart';

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
    Map data = {
      "score": widget.score,
      "user": widget.user,
      "quiz": widget.quiz,
    };
    // Score.postParticip(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz),
      ),
    );
  }
}

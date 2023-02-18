import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quizz/services/participationservices.dart';

class Participation extends ChangeNotifier {
  bool loading = false;
  dynamic participations = [];
  ParticpationRepo repo = ParticpationRepo();
  void postParticip(dynamic data) async {
    loading = true;
    repo.postParticipation(data);
    loading = false;
    
  }

  getQuiz(String user) async {
    loading = true;
    participations = await repo.getParticipations(user);
    loading = false;
    notifyListeners();
  }
}

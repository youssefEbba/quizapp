import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quizz/services/participationservices.dart';

class Participation extends ChangeNotifier {

  bool loading = false;
  ParticpationRepo repo = ParticpationRepo();
  void postParticip(dynamic data) async {
    loading = true;
    repo.postParticipation(data);
    loading = false;
  }
}

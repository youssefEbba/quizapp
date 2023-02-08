import 'package:quizz/provider/quizprovider.dart';

class Question {
    Question({
        required this.id,
        required this.question,
        required this.choix1,
        required this.choix2,
        required this.choix3,
        required this.reponse,
        required this.quiz,
    });

    int id;
    String question;
    String choix1;
    String choix2;
    String choix3;
    String reponse;
    Quiz quiz;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        choix1: json["choix1"],
        choix2: json["choix2"],
        choix3: json["choix3"],
        reponse: json["reponse"],
        quiz: json["quiz"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "choix1": choix1,
        "choix2": choix2,
        "choix3": choix3,
        "reponse": reponse,
        "quiz": quiz,
    };
}

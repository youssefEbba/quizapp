class Paricipation {
    Paricipation({
        required this.id,
        required this.date,
        required this.score,
        required this.user,
        required this.quiz,
    });

    int id;
    DateTime date;
    int score;
    int user;
    String quiz;

    factory Paricipation.fromJson(Map<String, dynamic> json) => Paricipation(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        score: json["score"],
        user: json["user"],
        quiz: json["quiz"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "score": score,
        "user": user,
        "quiz": quiz,
    };
}

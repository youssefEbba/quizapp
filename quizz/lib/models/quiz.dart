
class Quizz {
    Quizz({
        this.titre,
        this.categorie,
     this.date,
        this.duree,
    });

    String? titre;
    String? categorie;
    DateTime? date;
    int? duree;

    factory Quizz.fromJson(Map<String, dynamic> json) => Quizz(
        titre: json["titre"],
        categorie: json["categorie"],
        date: DateTime.parse(json["date"]),
        duree: json["duree"],
    );

    Map<String, dynamic> toJson() => {
        "titre": titre,
        "categorie": categorie,
        "date": date!.toIso8601String(),
        "duree": duree,
    };
}
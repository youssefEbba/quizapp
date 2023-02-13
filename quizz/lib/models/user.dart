class UserModel {
  UserModel({this.email, this.name, this.password, this.token, this.id});

  String? email;
  String? name;
  String? password;
  String? token;
  int? id;
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": email,
        "name": name,
        "password": password,
        "token": token,
      };
}

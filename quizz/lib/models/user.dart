
class UserModel {
  UserModel({
    this.email,
    this.name,
    this.password,
    this.token,
  });

  String? email;
  String? name;
  String? password;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["username"],
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

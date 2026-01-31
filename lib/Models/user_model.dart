class UserModel {
  String name;
  String id;
  String email;
  bool isVerified;

  UserModel({
    required this.name,
    this.id = " ",
    required this.email,
    this.isVerified = false,
  });

  static UserModel fromjson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      id: json["id"],
      email: json["email"],
      isVerified: json["isVerified"],
    );
  }
   Map<String, dynamic> tojson() {
    return {
      "name": name,
      "id": id,
      "email": email,
      "isVerified": isVerified,
    };
  }
}

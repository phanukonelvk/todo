


class UserInfoModel  {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;
  const UserInfoModel({
    this.id = 0,
    this.username = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.image = '',
    this.token = '',
  });

  UserInfoModel copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) =>
      UserInfoModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        token: token ?? this.token,
      );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
      };

  
}

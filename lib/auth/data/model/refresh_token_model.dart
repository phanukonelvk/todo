
class RefreshTokenModel {
    final int id;
    final String username;
    final String email;
    final String firstName;
    final String lastName;
    final String gender;
    final String image;
    final String refreshToken;

    RefreshTokenModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.refreshToken,
    });

    RefreshTokenModel copyWith({
        int? id,
        String? username,
        String? email,
        String? firstName,
        String? lastName,
        String? gender,
        String? image,
        String? refreshToken,
        
    }) => 
        RefreshTokenModel(
            id: id ?? this.id,
            username: username ?? this.username,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            gender: gender ?? this.gender,
            image: image ?? this.image,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => RefreshTokenModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        refreshToken: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": refreshToken,
    };
}

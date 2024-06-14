// To parse this JSON data, do
//
//     final siginRequest = siginRequestFromJson(jsonString);

import 'dart:convert';

SiginRequest siginRequestFromJson(String str) => SiginRequest.fromJson(json.decode(str));

String siginRequestToJson(SiginRequest data) => json.encode(data.toJson());

class SiginRequest {
    final String username;
    final String password;

    SiginRequest({
        required this.username,
        required this.password,
    });

    SiginRequest copyWith({
        String? username,
        String? password,
    }) => 
        SiginRequest(
            username: username ?? this.username,
            password: password ?? this.password,
        );

    factory SiginRequest.fromJson(Map<String, dynamic> json) => SiginRequest(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}

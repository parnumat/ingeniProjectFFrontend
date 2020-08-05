// To parse this JSON data, do
//
//     final reqLogin = reqLoginFromJson(jsonString);

import 'dart:convert';

ReqLogin reqLoginFromJson(String str) => ReqLogin.fromJson(json.decode(str));

String reqLoginToJson(ReqLogin data) => json.encode(data.toJson());

class ReqLogin {
  ReqLogin({
    this.username,
    this.password,
  });

  String username;
  String password;

  factory ReqLogin.fromJson(Map<String, dynamic> json) => ReqLogin(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

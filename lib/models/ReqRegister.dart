// To parse this JSON data, do
//
//     final reqRegister = reqRegisterFromJson(jsonString);

import 'dart:convert';

ReqRegister reqRegisterFromJson(String str) => ReqRegister.fromJson(json.decode(str));

String reqRegisterToJson(ReqRegister data) => json.encode(data.toJson());

class ReqRegister {
    ReqRegister({
        this.firstName,
        this.lastName,
        this.username,
        this.password,
        this.userLevel,
    });

    String firstName;
    String lastName;
    String username;
    String password;
    String userLevel;

    factory ReqRegister.fromJson(Map<String, dynamic> json) => ReqRegister(
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        password: json["password"],
        userLevel: json["userLevel"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "password": password,
        "userLevel": userLevel,
    };
}

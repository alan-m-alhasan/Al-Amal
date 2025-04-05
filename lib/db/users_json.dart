// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users users) => json.encode(users.toMap());

class Users {
  final int? userId;
  final String? userName;
  final String userPassword;
  final String userEmail;
  final String? userPhone;
  final String? userAge;
  final String? userGender;
  final String? accountType;

  Users({
    this.userId,
    this.userName,
    required this.userPassword,
    required this.userEmail,
    this.userPhone,
    this.userAge,
    this.userGender,
    this.accountType,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        userName: json["userName"],
        userPassword: json["userPassword"],
        userAge: json["userAge"],
        userEmail: json["userEmail"],
        userGender: json["userGender"],
        userPhone: json["userPhone"],
        accountType: json["accountType"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userPassword": userPassword,
        "userAge": userAge,
        "userEmail": userEmail,
        "userGender": userGender,
        "userPhone": userPhone,
        "accountType": accountType,
      };
}

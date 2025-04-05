// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DrQuestion {
  late final int id;
  late final String msg;
  late final String type;

  late Color UnClickedColor = Colors.green;
  late Color ClickedColor = Colors.grey;
  late Color? ClickedColorItem = Colors.grey[100];
  late Color? UnClickedColorItem = Colors.grey[300];
  late bool itemClicked = false;
  var answerCon = TextEditingController();

  DrQuestion({
    required this.id,
    required this.msg,
    required this.type,
  });

  factory DrQuestion.fromJson(Map<String, dynamic> json) {
    return DrQuestion(
      id: json['id'],
      msg: json['msg'],
      type: json['type'],
    );
  }
}

Future<List<DrQuestion>?>? getDrQues() async {
  final prefs = await SharedPreferences.getInstance();
  const key = 'api_token';
  final value = prefs.get(key) ?? "0";
  var response = await http.post(
    Uri.parse(
      "https://alwadi-center.com/myapp/ludo/public/api/doctorquestion",
    ),
    body: {'token': value},
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    try {
      List<DrQuestion> advices = body
          .map(
            (dynamic item) => DrQuestion.fromJson(item),
          )
          .toList();
      return advices;
    } catch (error) {
      print(error);
      return null;
    }
  } else {
    throw Exception("Failed To Load Advice");
  }
}

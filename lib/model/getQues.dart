// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Question {
  late final int id;
  late final String msg;
  late final String type;

  Question({
    required this.id,
    required this.msg,
    required this.type,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      msg: json['msg'],
      type: json['type'],
    );
  }
}

Future<List<Question>?> getAdvice() async {
  final prefs = await SharedPreferences.getInstance();
  const key = 'api_token';
  final value = prefs.get(key) ?? "0";
  var response = await http.post(
    Uri.parse(
      "https://alwadi-center.com/myapp/ludo/public/api/myquestion",
    ),
    body: {'token': value},
    /* headers: {
      'Content-Type': 'application/json',
    },*/
  );
/*  var resBody = jsonDecode(response.body);
  if (response.statusCode == 201) {
    return resBody;
  }*/
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    try {
      List<Question> advices = body
          .map(
            (dynamic item) => Question.fromJson(item),
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

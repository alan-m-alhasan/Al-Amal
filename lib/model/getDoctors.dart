// ignore_for_file: file_names, non_constant_identifier_names, avoid_print
import 'dart:convert';
import 'package:alamal/controller/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class DrAccounts {
  late final int id;
  late final String name;
  late final String gender;
  late final dynamic avatarMale = SvgPicture.asset(avatarDrMale);
  late final dynamic avatarFemale = SvgPicture.asset(avatarDrFemale);

  DrAccounts({
    required this.id,
    required this.name,
    required this.gender,
  });

  factory DrAccounts.fromJson(Map<String, dynamic> json) {
    return DrAccounts(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
    );
  }
}

Future<List<DrAccounts>?>? getDoctors() async {
  var response = await http.get(
    Uri.parse(
      "https://alwadi-center.com/myapp/ludo/public/api/doctor",
    ),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    try {
      List<DrAccounts> advices = body
          .map(
            (dynamic item) => DrAccounts.fromJson(item),
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

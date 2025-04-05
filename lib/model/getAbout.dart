// ignore_for_file: file_names, non_constant_identifier_names, unused_import, avoid_print

/*[
    {
        "id": 1,
        "title": "تطبيق الامل",
        "youtube": "https://youtube.com",
        "twiter": "https://twiter.com",
        "facebook": "https://facebook.com",
        "phone": "00963992955240",
        "logo": "",
        "overview": "تطبيق الامل ",
        "created_at": null,
        "updated_at": null
    }
]
*/
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAbout {
  late String title;
  late String youtube;
  late String twiter;
  late String facebook;
  late String phone;
  late String overview;

  GetAbout({
    required this.title,
    required this.youtube,
    required this.twiter,
    required this.facebook,
    required this.overview,
    required this.phone,
  });

  factory GetAbout.fromJson(Map<String, dynamic> json) {
    return GetAbout(
      title: json['title'],
      youtube: json['youtube'],
      twiter: json['twiter'],
      facebook: json['facebook'],
      overview: json['overview'],
      phone: json['phone'],
    );
  }
}

Future<List<GetAbout>?>? getAbout() async {
  var response = await http.get(
    Uri.parse(
      "https://alwadi-center.com/myapp/ludo/public/api/about",
    ),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);

    try {
      List<GetAbout> advices = body
          .map(
            (dynamic item) => GetAbout.fromJson(item),
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

// Future<GetAbout>? getAbout() async {
//   var response = await http.get(
//     Uri.parse(
//       "https://alwadi-center.com/myapp/ludo/public/api/about",
//     ),
//     headers: {
//       'Content-Type': 'application/json',
//     },
//   );

//   if (response.statusCode == 200) {
//     var body = jsonDecode(response.body);
//     return GetAbout.fromJson(body);
//     // try {
//     //   List<GetAbout> advices = body
//     //       .map(
//     //         (dynamic item) => GetAbout.fromJson(item),
//     //       )
//     //       .toList();
//     //   return advices;
//     // } catch (error) {
//     //   print(error);
//     //   return null;
//     // }
//   } else {
//     throw Exception("Failed To Load Advice");
//   }
// }

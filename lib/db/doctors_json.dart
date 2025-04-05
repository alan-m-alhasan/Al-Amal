// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// Doctors doctorsFromMap(String str) => Doctors.fromMap(json.decode(str));

// String doctorsToMap(Doctors doctors) => json.encode(doctors.toMap());

// class Doctors {
//   final int? drId;
//   final String drName;
//   final String drPassword;
//   final String drEmail;
//   final String drPhone;
//   final String drAge;
//   final String drGender;

//   Doctors({
//     this.drId,
//     required this.drName,
//     required this.drPassword,
//     required this.drEmail,
//     required this.drPhone,
//     required this.drAge,
//     required this.drGender,
//   });

//   factory Doctors.fromMap(Map<String, dynamic> json) => Doctors(
//         drId: json["drId"],
//         drName: json["drName"],
//         drPassword: json["drPassword"],
//         drAge: json["drAge"],
//         drEmail: json["drEmail"],
//         drGender: json["drGender"],
//         drPhone: json["drPhone"],
//       );

//   Map<String, dynamic> toMap() => {
//         "drId": drId,
//         "drName": drName,
//         "drPassword": drPassword,
//         "drAge": drAge,
//         "drEmail": drEmail,
//         "drGender": drGender,
//         "drPhone": drPhone,
//       };
// }

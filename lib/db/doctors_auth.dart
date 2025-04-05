// // ignore_for_file: use_build_context_synchronously

// import 'package:alamal/db/doctors_json.dart';
// import 'package:alamal/db/sql_helper.dart';
// import 'package:alamal/model/cacheHelper.dart';
// import 'package:flutter/material.dart';

// class DoctorsAuth {
//   DatabaseHelper db = DatabaseHelper();

//   void drRegister({
//     required String drName,
//     required String drPassword,
//     required String drEmail,
//     required String drPhone,
//     required String drAge,
//     required String drGender,
//     required BuildContext context,
//     required bool mounted,
//   }) async {
//     var res = await db.createDoctors(
//       Doctors(
//         drName: drName,
//         drPassword: drPassword,
//         drEmail: drEmail,
//         drPhone: drPhone,
//         drAge: drAge,
//         drGender: drGender,
//       ),
//     );
//     if (res > 0) {
//       if (mounted) {
//         CacheHelper.saveData(
//           key: 'isDoctor',
//           value: true,
//         );
//         CacheHelper.saveData(
//           key: 'hasLogged',
//           value: true,
//         );
//       } else {
//         // Error ........
//       }
//     }
//   }

//   void drChecking({
//     required List<Map<String, dynamic>> drData,
//     required String drName,
//     required String drPassword,
//     required String drEmail,
//     required String drPhone,
//     required String drAge,
//     required String drGender,
//     required BuildContext context,
//     required bool mounted,
//   }) {
//     if (drData.any((element) {
//           return element.containsValue(drName);
//         }) ==
//         false) {
//       drRegister(
//         drName: drName,
//         drPassword: drPassword,
//         drEmail: drEmail,
//         drPhone: drPhone,
//         drAge: drAge,
//         drGender: drGender,
//         context: context,
//         mounted: mounted,
//       );
//     } else {
//       // Error ........
//     }
//   }

//   void drLogin({
//     required String drName,
//     required String drPassword,
//     required String drEmail,
//     required String drPhone,
//     required String drAge,
//     required String drGender,
//     required BuildContext context,
//     required bool mounted,
//   }) async {
//     var res = await db.doctorAuthenticate(
//       Doctors(
//         drName: drName,
//         drPassword: drPassword,
//         drEmail: drEmail,
//         drPhone: drPhone,
//         drAge: drAge,
//         drGender: drGender,
//       ),
//     );
//     if (res == true) {
//       if (mounted) {
//         CacheHelper.saveData(
//           key: 'isDoctor',
//           value: true,
//         );
//         CacheHelper.saveData(
//           key: 'hasLogged',
//           value: true,
//         );
//       } else {
//         // Error ........
//       }
//     } else {
//       // Wrong Data ........
//     }
//     debugPrint(res.toString());
//   }
// }

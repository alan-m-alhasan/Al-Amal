// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:async';

import 'package:alamal/db/users_json.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // // ------------------- Doctors ------------------- //

  // final drDB_name = "doctors.db";

  // String doctors = '''
  // CREATE TABLE IF NOT EXISTS doctors(
  // drId INTEGER PRIMARY KEY AUTOINCREMENT,
  // drName TEXT,
  // drPassword TEXT NOT NULL,
  // drEmail TEXT NOT NULL,
  // drPhone TEXT NOT NULL,
  // drAge TEXT NOT NULL,
  // drGender TEXT NOT NULL
  // )
  // ''';

  // Future<Database> initDoctorsDB() async {
  //   final databasePath = await getDatabasesPath();
  //   final path = join(databasePath, drDB_name);
  //   return openDatabase(path, version: 1, onCreate: (db, version) async {
  //     await db.execute(doctors);
  //   });
  // }

  // // Delete Database
  // Future<void> deleteDoctorsDB() async {
  //   final databasePath = await getDatabasesPath();
  //   final path = join(databasePath, drDB_name);
  //   return deleteDatabase(path);
  // }

  // // Doctor Authenticate
  // Future<bool> doctorAuthenticate(Doctors doctors) async {
  //   final Database db = await initDoctorsDB();
  //   var res = await db.rawQuery(
  //       "select * from doctors where drName = '${doctors.drEmail}' AND drPassword = '${doctors.drPassword}' ");
  //   if (res.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // // Doctor Register
  // Future<int> createDoctors(Doctors doctors) async {
  //   final Database db = await initDoctorsDB();
  //   return db.insert("doctors", doctors.toMap());
  // }

  // // Doctor Delete
  // Future<int> deleteDoctors(int id) async {
  //   final Database db = await initDoctorsDB();
  //   return db.rawDelete("DELETE FROM doctors WHERE id = $id");
  // }

  // // Get All Doctors
  // Future<List<Map<String, dynamic>>> getDoctors() async {
  //   final Database db = await initDoctorsDB();
  //   var res = await db.rawQuery("select * from doctors");
  //   debugPrint(res.toString());
  //   return res;
  // }

  // ------------------- Users ------------------- //

  final usersDB_name = "users.db";

  String users = '''
  CREATE TABLE IF NOT EXISTS users(
  userId INTEGER PRIMARY KEY AUTOINCREMENT,
  userName TEXT NOT NULL,
  userPassword TEXT NOT NULL,
  userEmail TEXT NOT NULL,
  userPhone TEXT NOT NULL,
  userAge TEXT NOT NULL,
  userGender TEXT NOT NULL,
  accountType TEXT NOT NULL
  )
  ''';

  Future<Database> initUsersDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, usersDB_name);
    debugPrint(path.toString());
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(users);
      },
    );
  }

  // Delete Database
  Future<void> deleteUserDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, usersDB_name);
    return deleteDatabase(path);
  }

  // User Authenticate
  Future<bool> userAuthenticate(Users users) async {
    final Database db = await initUsersDB();
    var res = await db.rawQuery(
      "select * from users where userEmail = '${users.userEmail}' AND userPassword = '${users.userPassword}'",
    );
    if (res.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // User Register
  Future<int> createUser(Users users) async {
    final Database db = await initUsersDB();
    return db.insert("users", users.toMap());
  }

  // User Delete
  Future<int> deleteUser(int id) async {
    final Database db = await initUsersDB();
    return db.rawDelete("DELETE FROM users WHERE userId = $id");
  }

  // User Update To Doctor
  Future<int> updateUserToDoctor(int id) async {
    final Database db = await initUsersDB();
    return db.rawUpdate(
      "UPDATE users SET accountType = 'doctor' WHERE userId = $id",
    );
  }

  // User Update To Doctor
  Future<int> updateUser(Users users) async {
    final Database db = await initUsersDB();
    return db.update("users", users.toMap());
  }

  // Get All Users
  Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await initUsersDB();
    var res = await db.rawQuery("select * from users");
    debugPrint(res.toString());
    return res;
  }
}

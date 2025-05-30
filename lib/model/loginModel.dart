// ignore_for_file: non_constant_identifier_names, file_names

class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String gender;
  late String age;
  late String type;
  late String api_token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    type = json['type'];
    api_token = json['api_token'];
  }
}

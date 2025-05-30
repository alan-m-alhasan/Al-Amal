// ignore_for_file: file_names, non_constant_identifier_names, avoid_print
import 'package:alamal/controller/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrAccounts {
  late final int id;
  late final String name;
  late final String gender;
  late final dynamic avatarMale = SvgPicture.asset(avatarDrMale);
  late final dynamic avatarFemale = SvgPicture.asset(avatarDrFemale);

  DrAccounts({required this.id, required this.name, required this.gender});
}

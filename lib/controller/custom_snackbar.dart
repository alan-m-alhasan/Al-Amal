// ignore_for_file: non_constant_identifier_names

import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:flutter/material.dart';

dynamic CustomSnackBar({
  required BuildContext context,
  required String translateKey,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 16.0),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Center(
        child: Text(
          "${DemoLocalization.of(context)!.getTranslatedValue(translateKey)}",
          style: TextStyle(
            fontFamily: CacheHelper.getData(key: 'languageCode') == 'en'
                ? poppinsMedium
                : tajawalMedium,
          ),
        ),
      ),
    ),
  );
}

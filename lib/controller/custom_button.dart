// ignore_for_file: non_constant_identifier_names, null_check_always_fails

import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:flutter/material.dart';

Widget CustomButton({
  required BuildContext context,
  Color? bgColor,
  Color? titleColor = Colors.white,
  required void Function()? onPressed,
  double? height = 60.0,
  double? width,
  String? translateKey,
  bool hasBorder = true,
  double? elevation,
  double? highlightElevation,
  bool hasChild = false,
  Widget? child,
  double radius = 20.0,
  double borderWidth = 2.0,
  AlignmentGeometry contentAlignment = Alignment.center,
  Color? splashColor,
  Color? highlightColor,
  EdgeInsetsGeometry? padding,
  required Color primaryColor,
  void Function()? onLongPress,
  void Function(bool)? onHighlightChanged,
  double titleFontSize = 20.0,
  TextAlign? textAlign,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: MaterialButton(
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      padding: padding,
      elevation: elevation,
      highlightElevation: highlightElevation,
      disabledColor: primaryColor.withOpacity(0.5),
      color: bgColor,
      onPressed: onPressed,
      splashColor: hasChild ? splashColor : primaryColor.withOpacity(0.3),
      highlightColor: hasChild ? highlightColor : primaryColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: hasBorder
            ? BorderSide(
                color: primaryColor,
                width: borderWidth,
              )
            : BorderSide.none,
      ),
      child: hasChild
          ? child
          : Align(
              alignment: contentAlignment,
              child: Text(
                "${DemoLocalization.of(context)!.getTranslatedValue(translateKey.toString())}",
                textAlign: textAlign,
                style: TextStyle(
                  color: titleColor,
                  fontSize: titleFontSize,
                  fontFamily: CacheHelper.getData(key: 'languageCode') == 'en'
                      ? poppinsMedium
                      : tajawalMedium,
                ),
              ),
            ),
    ),
  );
}

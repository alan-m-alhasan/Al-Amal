import 'package:alamal/controller/constant.dart';
import 'package:alamal/model/dr_patients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

bool isTextOverflowing({
  required String text,
  required TextStyle style,
  required double maxWidth,
  required int maxLines,
}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: maxWidth);

  return textPainter.didExceedMaxLines;
}

Widget PatientHistoryCard({
  required String type,
  required HistoryItemType historyItemType,
  required String content,
  required String date,
  required Color primaryColor,
  required String langCode,
  required BuildContext context,
}) {
  final fontFamily = langCode == 'en' ? poppinsMedium : tajawalMedium;
  TextStyle textStyle = TextStyle(fontFamily: fontFamily);
  final bool isLongText = isTextOverflowing(
    text: content,
    style: textStyle,
    maxWidth: 300.0, // العرض المتاح للنص
    maxLines: 1,
  );

  if (isLongText) {
    print('Long Text');
  } else {
    print("Short Text");
  }

  return Card(
    color: primaryColor.withOpacity(.1),
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: primaryColor, width: 1.5),
    ),
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment:
              isLongText ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          spacing: 10.0,
          children: [
            SvgPicture.asset(
              historyItemType == HistoryItemType.consultation
                  ? consultationOutlined
                  : voiceCall,
              color: primaryColor,
              height: 35.0,
              fit: BoxFit.cover,
            ),
            VerticalDivider(
              color: primaryColor,
              thickness: 1,
              width: 20,
              indent: isLongText ? 0.0 : 10.0,
              endIndent: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Row(
                    children: [
                      Text(
                        "$type ${langCode == 'ar' ? 'في ' : 'in'} ",
                        style: textStyle,
                      ),
                      Text(
                        date,
                        textDirection: TextDirection.ltr,
                        style: textStyle,
                      ),
                    ],
                  ),
                  Text(
                    content,
                    style: textStyle,
                    softWrap: true,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

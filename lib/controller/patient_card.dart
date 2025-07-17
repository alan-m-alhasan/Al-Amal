import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class HistoryCard extends StatefulWidget {
//   final String nudeImage;
//   final String model;
//   final String dressType;
//   final String dressColor;
//   final String bodyType;
//   final String date;
//   final int historyTaskId;
//   final bool selected;
//   final VoidCallback? onPressed;
//   final VoidCallback? onDelete;
//   final VoidCallback? onLongPress;
//
//   const HistoryCard({
//     super.key,
//     required this.nudeImage,
//     required this.model,
//     required this.dressType,
//     required this.dressColor,
//     required this.bodyType,
//     required this.date,
//     required this.historyTaskId,
//     required this.context,
//     required this.selected,
//     required this.onPressed,
//     required this.onDelete,
//     required this.onLongPress,
//   });
//
//   final BuildContext context;
//
//   @override
//   State<HistoryCard> createState() => _HistoryCardState();
// }
//
// class _HistoryCardState extends State<HistoryCard> {
//   late MemoryImage _cachedImage;
//
//   @override
//   void initState() {
//     super.initState();
//     final decodedBytes = base64Decode(widget.nudeImage);
//     _cachedImage = MemoryImage(decodedBytes);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: widget.onPressed,
//       onLongPress: widget.onLongPress,
//       style: ButtonStyle(
//         backgroundColor: WidgetStateProperty.all(
//           AppColors.primaryColor.withOpacity(0.2),
//         ),
//         shape: WidgetStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//             side:
//                 widget.selected
//                     ? BorderSide(color: AppColors.primaryColor, width: 2.0)
//                     : BorderSide.none,
//           ),
//         ),
//         padding: WidgetStateProperty.all(EdgeInsets.zero),
//       ),
//       child: Stack(
//         alignment: Alignment.bottomRight,
//         children: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: PatientCard(
//                   memoryImage: _cachedImage,
//                   model: widget.model,
//                   dressType: widget.dressType,
//                   dressColor: widget.dressColor,
//                   bodyType: widget.bodyType,
//                   date: widget.date,
//                   historyTaskId: widget.historyTaskId,
//                 ),
//               ),
//               IconButton(
//                 onPressed: widget.onDelete,
//                 iconSize: 20.0,
//                 color: Colors.white,
//                 icon: Icon(Icons.delete),
//               ),
//             ],
//           ),
//           if (widget.selected)
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: CircleAvatar(
//                 radius: 12.0,
//                 foregroundColor: Colors.white,
//                 child: Icon(Icons.check_rounded, size: 20.0),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

Widget PatientCard({
  required String name,
  required String age,
  required String condition,
  required String diseaseName,
  required int patientId,
  required Color cardColor,
  required String langCode,
  required Color borderColor,
  required String patientGender,
  required void Function()? onTap,
  required BuildContext context,
}) {
  final fontFamily = langCode == 'en' ? poppinsMedium : tajawalMedium;
  TextStyle textStyle = TextStyle(fontFamily: fontFamily);
  return Card(
    color: cardColor,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: borderColor, width: 1.5),
    ),
    margin: EdgeInsets.zero,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            patientGender == 'male' ? patientMale : patientFemale,
            height: 90.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Flex(
              spacing: 10.0,
              direction: Axis.horizontal,
              children: [
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${AppLocalization.of(context)!.getTranslatedValue('name')}",
                      style: textStyle,
                    ),
                    Text(
                      "${AppLocalization.of(context)!.getTranslatedValue('age')}",
                      style: textStyle,
                    ),
                    Text(
                      "${AppLocalization.of(context)!.getTranslatedValue('disease')}",
                      style: textStyle,
                    ),
                    Text(
                      "${AppLocalization.of(context)!.getTranslatedValue('condition')}",
                      style: textStyle,
                    ),
                  ],
                ),
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 4; i++) Text(':', style: textStyle),
                  ],
                ),
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(name, style: textStyle),
                    Text(age, style: textStyle),
                    Text(diseaseName, style: textStyle),
                    Text(condition, style: textStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

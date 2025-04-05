// ignore_for_file: file_names, avoid_types_as_parameter_names, deprecated_member_use, library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/payMethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:table_calendar/table_calendar.dart';

class VoiceCall extends StatefulWidget {
  const VoiceCall({Key? key}) : super(key: key);

  @override
  _VoiceCallState createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: state.color,
            elevation: 0.0,
            leading: Directionality(
              textDirection: CacheHelper.getData(key: 'languageCode') == 'ar'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                iconSize: 22.0,
                icon: CacheHelper.getData(key: 'languageCode') == 'ar'
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                      )
                    : const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
              ),
            ),
            toolbarHeight: 75.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            titleSpacing: 0.0,
            leadingWidth: 65.0,
            title: Text(
              "${DemoLocalization.of(context)!.getTranslatedValue('soundCall')}",
              overflow: TextOverflow.visible,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 14.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${DemoLocalization.of(context)!.getTranslatedValue('chooseDay')}",
                      style: TextStyle(
                        color: state.color,
                        fontSize: 20.0,
                        fontFamily:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? poppinsMedium
                                : tajawalMedium,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      AmalIcons.calendar3,
                      color: state.color,
                      size: 24.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2060, 1, 1),
                    locale: 'en',
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _focusedDay = focusedDay;
                          _selectedDay = selectedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {},
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarFormat: _calendarFormat,
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: state.color.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: state.color,
                      ),
                      selectedTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: Colors.white,
                      ),
                      todayTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: state.color,
                      ),
                      disabledTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: state.color.withOpacity(0.5),
                      ),
                      defaultTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: state.color,
                      ),
                      holidayTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: state.color,
                      ),
                      outsideTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        color: state.color,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: state.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                        fontFamily: poppinsMedium,
                        fontSize: 16.0,
                        color: state.color,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SlidableButton(
                  onChanged: (slide) {
                    if (_selectedDay != null) {
                      push(
                        context: context,
                        page: const PayMethod(),
                      );
                      debugPrint(
                          "${_selectedDay?.year}-${_selectedDay?.month}-${_selectedDay?.day}");
                    } else {
                      CustomSnackBar(
                        context: context,
                        translateKey: 'choose_date_time',
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(20.0),
                  isRestart: true,
                  color: state.color.withOpacity(0.2),
                  buttonColor: state.color,
                  width: fullWidth(context) - 50.0,
                  height: 65.0,
                  buttonWidth: fullWidth(context) * 0.5,
                  label: Container(
                    alignment: Alignment.center,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${DemoLocalization.of(context)!.getTranslatedValue('bookNow')}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily:
                                    CacheHelper.getData(key: 'languageCode') ==
                                            'en'
                                        ? poppinsMedium
                                        : tajawalMedium),
                          ),
                          const SizedBox(
                            width: 14.0,
                          ),
                          const Icon(
                            AmalIcons.send2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "10\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: state.color,
                          fontFamily: poppinsMedium,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

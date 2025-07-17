import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/patient_history_card.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/dr_patients.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHistoryScreen extends StatefulWidget {
  final List<PatientHistory> history;

  const PatientHistoryScreen({super.key, required this.history});

  @override
  State<StatefulWidget> createState() => PatientHistoryScreenState();
}

class PatientHistoryScreenState extends State<PatientHistoryScreen> {
  String? langCode;
  bool isLoading = true;
  List<PatientHistory> sortedHistory = [];

  @override
  void initState() {
    super.initState();
    sortedHistory = List.from(widget.history)
      ..sort((a, b) => b.date.compareTo(a.date));
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        langCode = state.locale.languageCode;
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: state.color,
                actionsPadding: EdgeInsets.symmetric(horizontal: 26.0),
                actions: [],
                elevation: 0.0,
                leading: CustomBackButton(langCode.toString(), context),
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
                  "${AppLocalization.of(context)!.getTranslatedValue('patient_history')}",
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body:
                  isLoading == true
                      ? Center(
                        child: CircularProgressIndicator(color: state.color),
                      )
                      : NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.separated(
                          itemCount: sortedHistory.length,
                          padding: EdgeInsets.all(12.0),
                          separatorBuilder:
                              (context, index) => SizedBox(height: 10.0),
                          itemBuilder: (context, index) {
                            print(sortedHistory[index].id);
                            final itemType =
                                sortedHistory[index].type ==
                                        HistoryItemType.consultation
                                    ? "${AppLocalization.of(context)!.getTranslatedValue('writtenConsult')}"
                                    : "${AppLocalization.of(context)!.getTranslatedValue('soundCall')}";
                            final history =
                                langCode == 'en'
                                    ? sortedHistory[index]
                                    : sortedHistory[index];
                            final pmAm = history.date.hour > 12 ? "PM" : "AM";
                            final zeroOfMin =
                                history.date.minute < 10 ? "0" : "";
                            final date =
                                "${history.date.year}-${history.date.month}-${history.date.day}  ${history.date.hour}:${history.date.minute}$zeroOfMin $pmAm";

                            return PatientHistoryCard(
                              context: context,
                              historyItemType: history.type,
                              langCode: langCode.toString(),
                              type: itemType,
                              content: history.content.toString(),
                              date: date,
                              primaryColor: state.color,
                            );
                          },
                        ),
                      ),
            );
          },
        );
      },
    );
  }
}

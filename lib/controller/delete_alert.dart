// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';

import 'package:alamal/controller/constant.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/db/users_auth.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAlert extends StatefulWidget {
  const DeleteAlert({super.key});

  @override
  State<DeleteAlert> createState() => _DeleteAlertState();
}

class _DeleteAlertState extends State<DeleteAlert> {
  bool isDeleteLoading = false;
  List<Map<String, dynamic>> accountsData = [];
  DatabaseHelper db = DatabaseHelper();

  int getUserIndex() {
    return accountsData.indexWhere(
      (element) => element['userEmail'] == CacheHelper.getData(key: 'email'),
    );
  }

  double _progress = 0.0;
  Timer? _timer;

  void startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      setState(() {
        if (_progress < 1.0) {
          isDeleteLoading = true;

          _progress += 0.005;
        } else {
          timer.cancel();
          UsersAuth().deleteAccount(
            id: accountsData[getUserIndex()]['userId'],
            context: context,
            mounted: mounted,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    db.getUsers().then((users) {
      setState(() {
        accountsData.addAll(users);
      });
      getUserIndex();
    });
    // startProgress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AlertDialog(
          actionsPadding: isDeleteLoading ? EdgeInsets.zero : null,
          title: Text(
            "${AppLocalization.of(context)?.getTranslatedValue('attention')}",
            style: TextStyle(
              color: Colors.red[700],
              fontFamily:
                  CacheHelper.getData(key: 'languageCode') == 'en'
                      ? poppinsMedium
                      : tajawalMedium,
            ),
          ),
          content: Text(
            "${AppLocalization.of(context)?.getTranslatedValue('when_account_del')}",
            style: TextStyle(
              fontFamily:
                  CacheHelper.getData(key: 'languageCode') == 'en'
                      ? poppinsMedium
                      : tajawalMedium,
            ),
          ),
          actions:
              isDeleteLoading
                  ? [
                    Padding(
                      padding: const EdgeInsets.only(top: 54.0),
                      child: LinearProgressIndicator(
                        minHeight: 10,
                        color: Colors.red,
                        backgroundColor: Colors.red[100],
                        value: _progress,
                      ),
                    ),
                  ]
                  : [
                    TextButton(
                      onPressed:
                          isDeleteLoading
                              ? null
                              : () {
                                startProgress();
                              },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.red[700]?.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        "${AppLocalization.of(context)?.getTranslatedValue('del')}",
                        style: TextStyle(
                          color: Colors.red[700],
                          fontFamily:
                              CacheHelper.getData(key: 'languageCode') == 'en'
                                  ? poppinsMedium
                                  : tajawalMedium,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pop(context: context);
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          state.color.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        "${AppLocalization.of(context)?.getTranslatedValue('cancel')}",
                        style: TextStyle(
                          color: state.color,
                          fontFamily:
                              CacheHelper.getData(key: 'languageCode') == 'en'
                                  ? poppinsMedium
                                  : tajawalMedium,
                        ),
                      ),
                    ),
                  ],
        );
      },
    );
  }
}

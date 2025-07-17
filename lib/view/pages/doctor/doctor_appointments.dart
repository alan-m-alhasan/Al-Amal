// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorAppointments extends StatefulWidget {
  const DoctorAppointments({super.key});

  @override
  _DoctorAppointmentsState createState() => _DoctorAppointmentsState();
}

class _DoctorAppointmentsState extends State<DoctorAppointments> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  bool isEmpty = false;
  bool isRefreshed = false;

  // String? appointmentsTitle;

  void checkLangIfRefreshed() {
    if (CacheHelper.getData(key: 'languageCode') == 'ar' &&
        "${AppLocalization.of(context)?.getTranslatedValue('voice_call_appointments')}"
            .contains(RegExp(r'[a-zA-Z]'))) {
      debugPrint('Checking done in arabic');
      setState(() {});
    } else if (CacheHelper.getData(key: 'languageCode') == 'en' &&
        !"${AppLocalization.of(context)?.getTranslatedValue('voice_call_appointments')}"
            .contains(RegExp(r'[a-zA-Z]'))) {
      debugPrint('Checking done in english');
      setState(() {});
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isRefreshed = true;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkLangIfRefreshed();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body:
              isEmpty == true
                  ? Center(
                    child: Text(
                      "${AppLocalization.of(context)!.getTranslatedValue('noRandiYet')}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                  )
                  : !isLoading
                  ? RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isLoading = true;
                        });
                      }).then((value) {
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      });
                    },
                    color: state.color,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.all(10.0),
                      itemCount: 10,
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 10.0),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          tileColor: state.color.withOpacity(0.15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minLeadingWidth: 30.0,
                          leading: Container(
                            alignment: Alignment.center,
                            width: 30.0,
                            child: Icon(Icons.call, color: state.color),
                          ),
                          title: Text(
                            "${AppLocalization.of(context)?.getTranslatedValue('voice_call_appointments')}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                              fontSize:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? 18.0
                                      : 20.0,
                            ),
                          ),
                          isThreeLine: true,
                          subtitle: Text(
                            'Alan Alhasan\n2025/06/25 - 12:00 AM',
                            style: TextStyle(
                              fontFamily:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                              fontSize: 15.0,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  : Center(
                    child: CircularProgressIndicator(color: state.color),
                  ),
        );
      },
    );
  }
}

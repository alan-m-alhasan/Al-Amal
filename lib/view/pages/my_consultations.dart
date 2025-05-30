// ignore_for_file: file_names, curly_braces_in_flow_control_structures, empty_statements, library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConsultations extends StatefulWidget {
  const MyConsultations({Key? key}) : super(key: key);

  @override
  _MyConsultationsState createState() => _MyConsultationsState();
}

class _MyConsultationsState extends State<MyConsultations> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  late bool isEmpty = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  String? langCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAdviceCubit(),
      child: BlocConsumer<MyAdviceCubit, MyAdviceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              langCode = state.locale.languageCode;
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Scaffold(
                      key: scaffoldKey,
                      appBar: AppBar(
                        backgroundColor: state.color,
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
                          "${AppLocalization.of(context)!.getTranslatedValue('myConsultation')}",
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      body: Column(
                        children: [
                          isEmpty == true
                              ? Expanded(
                                child: Center(
                                  child: Text(
                                    "${AppLocalization.of(context)!.getTranslatedValue('noAdviceYet')}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              )
                              : Expanded(
                                child:
                                    (!isLoading)
                                        ? NotificationListener<
                                          OverscrollIndicatorNotification
                                        >(
                                          onNotification: (overscroll) {
                                            overscroll.disallowIndicator();
                                            return true;
                                          },
                                          child: RefreshIndicator(
                                            onRefresh: () async {
                                              await Future.delayed(
                                                const Duration(seconds: 2),
                                                () {
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                },
                                              ).then((value) {
                                                Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () {
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                  },
                                                );
                                              });
                                            },
                                            color: state.color,
                                            child: ListView.separated(
                                              itemCount: 20,
                                              separatorBuilder:
                                                  (context, index) => Divider(
                                                    thickness: 1.5,
                                                    color: state.color
                                                        .withOpacity(0.2),
                                                    height: 20.0,
                                                  ),
                                              padding: const EdgeInsets.all(
                                                16.0,
                                              ),
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  tileColor: state.color
                                                      .withOpacity(0.15),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.0,
                                                        ),
                                                  ),
                                                  minLeadingWidth: 30.0,
                                                  leading: Container(
                                                    alignment: Alignment.center,
                                                    width: 30.0,
                                                    child: Icon(
                                                      AmalIcons.document,
                                                      color: state.color,
                                                    ),
                                                  ),
                                                  // dense: true,
                                                  title: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          CacheHelper.getData(
                                                                    key:
                                                                        'languageCode',
                                                                  ) ==
                                                                  'en'
                                                              ? poppinsMedium
                                                              : tajawalMedium,
                                                      fontSize:
                                                          CacheHelper.getData(
                                                                    key:
                                                                        'languageCode',
                                                                  ) ==
                                                                  'en'
                                                              ? 18.0
                                                              : 20.0,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    'Normal Advice',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          CacheHelper.getData(
                                                                    key:
                                                                        'languageCode',
                                                                  ) ==
                                                                  'en'
                                                              ? poppinsMedium
                                                              : tajawalMedium,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                        : Center(
                                          child: CircularProgressIndicator(
                                            color: state.color,
                                          ),
                                        ),
                              ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// ignore_for_file: file_names, unnecessary_string_interpolations, null_check_always_fails, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorConsultations extends StatefulWidget {
  const DoctorConsultations({Key? key}) : super(key: key);

  @override
  _DoctorConsultationsState createState() => _DoctorConsultationsState();
}

class _DoctorConsultationsState extends State<DoctorConsultations> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  bool isEmpty = false;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrAccountsCubit(),
      child: BlocConsumer<DrAccountsCubit, DrAccountsStates>(
        listener: (context, state) {
          if (state is DrAccountsLoadingState) {}
          if (state is DrAccountsSuccessState) {}
        },
        builder: (context, state) =>
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            body: isEmpty == true
                ? Center(
                    child: Text(
                      "${DemoLocalization.of(context)!.getTranslatedValue('noConsultationYet')}",
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
                          clipBehavior: Clip.none,
                          padding: const EdgeInsets.all(10.0),
                          itemCount: 10,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10.0,
                          ),
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
                                child: Icon(
                                  AmalIcons.document,
                                  color: state.color,
                                ),
                              ),
                              // dense: true,
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: CacheHelper.getData(
                                              key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                                  fontSize: CacheHelper.getData(
                                              key: 'languageCode') ==
                                          'en'
                                      ? 18.0
                                      : 20.0,
                                ),
                              ),
                              subtitle: Text(
                                'Normal Advice',
                                style: TextStyle(
                                  fontFamily: CacheHelper.getData(
                                              key: 'languageCode') ==
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
                        child: CircularProgressIndicator(
                          color: state.color,
                        ),
                      ),
          );
        }),
      ),
    );
  }
}

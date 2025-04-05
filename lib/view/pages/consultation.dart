// ignore_for_file: file_names, avoid_types_as_parameter_names, non_constant_identifier_names, deprecated_member_use, unused_element

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/consultationThanks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidable_button/slidable_button.dart';

class Consultation extends StatefulWidget {
  const Consultation({
    super.key,
  });

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  var msg = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConsultationCubit(),
      child: BlocConsumer<ConsultationCubit, ConsultationStates>(
        listener: (context, state) {
          if (state is ConsultationErrorState) {
            CustomSnackBar(
              context: context,
              translateKey: 'errorHappened',
            );
          }
          if (state is ConsultationSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ConsultationThanks()),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: state.color,
                  elevation: 0.0,
                  leading: Directionality(
                    textDirection:
                        CacheHelper.getData(key: 'languageCode') == 'ar'
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
                    "${DemoLocalization.of(context)!.getTranslatedValue('writtenConsult')}",
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                body: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "${DemoLocalization.of(context)!.getTranslatedValue('writeAdv')}",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: CacheHelper.getData(
                                              key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Form(
                            key: formKey,
                            child: TextFormField(
                              controller: msg,
                              cursorColor: state.color,
                              maxLines: 16,
                              textInputAction: TextInputAction.newline,
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    "${DemoLocalization.of(context)!.getTranslatedValue('hintOfConsultMsg')}",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey[500]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: state.color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          !isLoading
                              ? SlidableButton(
                                  borderRadius: BorderRadius.circular(20.0),
                                  isRestart: true,
                                  onChanged: (slide) {
                                    if (msg.text.isNotEmpty) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          push(
                                            context: context,
                                            page: const ConsultationThanks(),
                                          );
                                        },
                                      );
                                    } else {
                                      CustomSnackBar(
                                        context: context,
                                        translateKey: 'plzEnterMsg',
                                      );
                                    }
                                  },
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${DemoLocalization.of(context)!.getTranslatedValue('send')}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontFamily: CacheHelper.getData(
                                                            key:
                                                                'languageCode') ==
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
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  height: 65.0,
                                  child: CircularProgressIndicator(
                                    color: state.color,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

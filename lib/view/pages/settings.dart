// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'dart:async';

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/colors_dialog.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/delete_alert.dart';
import 'package:alamal/controller/lang_dialog.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/verify_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:just_audio/just_audio.dart';

class SettingsPage extends StatefulWidget {
  bool? isStateChanged;

  SettingsPage({super.key, this.isStateChanged});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    if (widget.isStateChanged == true) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          setState(() {
            widget.isStateChanged = false;
          });
        },
      );
    }
    super.initState();
  }

  bool isExpanded = false;
  bool isToneEnabled = CacheHelper.getData(key: 'isToneEnabled');
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: widget.isStateChanged == true
              ? null
              : AppBar(
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
                    "${DemoLocalization.of(context)!.getTranslatedValue('settings')}",
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
          body: widget.isStateChanged == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: state.color,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const LanguageDialog(),
                          );
                        },
                        splashColor: state.color.withOpacity(0.3),
                        highlightColor: state.color.withOpacity(0.2),
                        child: ListTile(
                          title: Text(
                            "${DemoLocalization.of(context)!.getTranslatedValue('lang')}",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                            ),
                          ),
                          leading: const Icon(
                            AmalIcons.earth,
                            color: Colors.black,
                          ),
                          trailing: Text(
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 'English'
                                : 'العربية',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black45,
                        indent: 26.0,
                        endIndent: 16.0,
                        height: 16.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const ColorsDialog(),
                          );
                        },
                        splashColor: state.color.withOpacity(0.3),
                        highlightColor: state.color.withOpacity(0.2),
                        child: ListTile(
                          title: Text(
                            "${DemoLocalization.of(context)?.getTranslatedValue('change_palette')}",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontFamily:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                            ),
                          ),
                          leading: const Icon(
                            Icons.palette_outlined,
                            color: Colors.black,
                          ),
                          trailing: CircleAvatar(
                            radius: 16.3,
                            backgroundColor: Colors.black54,
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 13.5,
                                backgroundColor: state.color,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black45,
                        indent: 26.0,
                        endIndent: 16.0,
                        height: 16.0,
                      ),
                      MaterialButton(
                        onPressed: null,
                        child: ListTile(
                          title: Text(
                            "${DemoLocalization.of(context)?.getTranslatedValue('startup_tone')}",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontFamily:
                                  CacheHelper.getData(key: 'languageCode') ==
                                          'en'
                                      ? poppinsMedium
                                      : tajawalMedium,
                            ),
                          ),
                          leading: const Icon(
                            Icons.music_note_rounded,
                            color: Colors.black,
                          ),
                          trailing: SizedBox(
                            width: 70.0,
                            child: FlutterSwitch(
                              width: 70.0,
                              value: isToneEnabled,
                              borderRadius: 50.0,
                              padding: 5.0,
                              inactiveSwitchBorder: Border.all(
                                color: state.color,
                                width: 1.5,
                              ),
                              inactiveColor: state.color.withOpacity(0.3),
                              activeColor: state.color,
                              activeIcon: Icon(
                                Icons.music_note_rounded,
                                color: state.color,
                              ),
                              onToggle: (value) async {
                                setState(() {
                                  isToneEnabled = value;
                                });
                                CacheHelper.saveData(
                                  key: 'isToneEnabled',
                                  value: value,
                                );
                                if (value) {
                                  await player.setAsset(logoSound);
                                  await player.play();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      if (CacheHelper.getData(key: 'accountType') != 'doctor')
                        const Divider(
                          color: Colors.black45,
                          indent: 26.0,
                          endIndent: 16.0,
                          height: 16.0,
                        ),
                      if (CacheHelper.getData(key: 'accountType') != 'doctor')
                        MaterialButton(
                          onPressed: () {
                            push(
                              context: context,
                              page: const VerifyAccount(),
                            );
                          },
                          splashColor: state.color.withOpacity(0.3),
                          highlightColor: state.color.withOpacity(0.2),
                          child: ListTile(
                            title: Text(
                              "${DemoLocalization.of(context)?.getTranslatedValue('account_verify')}",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontFamily:
                                    CacheHelper.getData(key: 'languageCode') ==
                                            'en'
                                        ? poppinsMedium
                                        : tajawalMedium,
                              ),
                            ),
                            leading: const Icon(
                              AmalIcons.verify,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: isExpanded ? fullWidth(context) : 70.0,
                            child: isExpanded
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        child: CustomButton(
                                          primaryColor: Colors.red[700]!,
                                          context: context,
                                          height: 50.0,
                                          width: 50.0,
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            setState(() {
                                              isExpanded = false;
                                            });
                                          },
                                          splashColor:
                                              Colors.red.withOpacity(0.3),
                                          highlightColor:
                                              Colors.red.withOpacity(0.2),
                                          hasChild: true,
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.red[700],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      CustomButton(
                                        primaryColor: state.color,
                                        height: 70.0,
                                        context: context,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            barrierColor: Colors.red[200]
                                                ?.withOpacity(0.5),
                                            builder: (context) =>
                                                const DeleteAlert(),
                                          );
                                        },
                                        splashColor:
                                            Colors.red.withOpacity(0.3),
                                        highlightColor:
                                            Colors.red.withOpacity(0.2),
                                        hasBorder: false,
                                        bgColor: isExpanded
                                            ? Colors.red[700]
                                            : Colors.red[300],
                                        hasChild: true,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "${DemoLocalization.of(context)?.getTranslatedValue('del_account')}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize:
                                                        isExpanded ? 19.0 : 0.0,
                                                    color: Colors.white,
                                                    fontFamily: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? poppinsBold
                                                        : tajawalBold,
                                                  ),
                                                ),
                                              ),
                                              const Icon(
                                                AmalIcons.deleteAccount,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : CustomButton(
                                    primaryColor: state.color,
                                    height: 70.0,
                                    context: context,
                                    onPressed: () {
                                      setState(() {
                                        isExpanded = true;
                                      });
                                    },
                                    splashColor: Colors.red.withOpacity(0.3),
                                    highlightColor: Colors.red.withOpacity(0.2),
                                    hasBorder: false,
                                    bgColor: Colors.red[300],
                                    hasChild: true,
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        end: 8.0,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: Icon(
                                          AmalIcons.deleteAccount,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}

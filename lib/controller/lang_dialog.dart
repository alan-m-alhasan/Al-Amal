import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/language.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  Language? language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 24.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  height: 55.0,
                  primaryColor: state.color,
                  context: context,
                  onPressed: () {
                    if (CacheHelper.getData(key: 'languageCode') == 'ar') {
                      context.read<LanguageBloc>().add(ChangeLanguage('en'));
                      pop(context: context);
                      pushReplacement(
                        context: context,
                        page: SettingsPage(isStateChanged: true),
                      );
                    } else {
                      pop(context: context);
                    }
                  },
                  width: double.infinity,
                  titleColor: Colors.black,
                  bgColor: state.color.withOpacity(0.2),
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  radius: 4.0,
                  hasBorder: false,
                  hasChild: true,
                  child: Row(
                    children: [
                      const Icon(AmalIcons.earth),
                      const SizedBox(width: 20.0),
                      Text(
                        'English',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: poppinsRegular,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black45,
                  indent: 12.0,
                  endIndent: 12.0,
                  height: 14.0,
                ),
                CustomButton(
                  height: 55.0,
                  primaryColor: state.color,
                  context: context,
                  onPressed: () {
                    if (CacheHelper.getData(key: 'languageCode') == 'en') {
                      context.read<LanguageBloc>().add(ChangeLanguage('ar'));
                      pop(context: context);
                      pushReplacement(
                        context: context,
                        page: SettingsPage(isStateChanged: true),
                      );
                    } else {
                      pop(context: context);
                    }
                  },
                  width: double.infinity,
                  titleColor: Colors.black,
                  bgColor: state.color.withOpacity(0.2),
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  radius: 4.0,
                  hasBorder: false,
                  hasChild: true,
                  child: Row(
                    children: [
                      const Icon(AmalIcons.earth),
                      const SizedBox(width: 20.0),
                      Text(
                        'العربية',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: tajawalRegular,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

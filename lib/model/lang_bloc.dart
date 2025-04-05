// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_visible_for_testing_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alamal/controller/constant.dart';

// Events
abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;
  ChangeLanguage(this.languageCode);
}

// State
class LanguageState {
  final Locale locale;
  final String fontFamily;

  LanguageState({
    required this.locale,
    required this.fontFamily,
  });
}

// Bloc
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageState(
          locale: const Locale('en'),
          fontFamily: poppinsRegular,
        )) {
    _loadLanguage();

    on<ChangeLanguage>((event, emit) async {
      String fontFamily =
          event.languageCode == 'ar' ? tajawalRegular : poppinsRegular;
      Locale locale = Locale(event.languageCode);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', event.languageCode);
      print('Font family selected: $fontFamily');

      emit(LanguageState(
        locale: locale,
        fontFamily: fontFamily,
      ));
    });
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode') ?? 'en';
    String fontFamily = languageCode == 'ar' ? tajawalRegular : poppinsRegular;
    print('Loaded language: $languageCode');
    print('Loaded font family: $fontFamily');
    emit(LanguageState(
      locale: Locale(languageCode),
      fontFamily: fontFamily,
    ));
  }
}

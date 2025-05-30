import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Map<String, String>? _localizationValues;

  Future<bool> load() async {
    String jsonStringValues = await rootBundle.loadString(
      'lib/language/${locale.languageCode}.json',
    );

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizationValues = mappedJson.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    return true;
  }

  String? getTranslatedValue(String key) {
    return _localizationValues![key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _DemoLocalizationDelegate();
}

class _DemoLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _DemoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationDelegate old) {
    return false;
  }
}

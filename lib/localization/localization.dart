import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalization {
  final Locale locale;
  DemoLocalization(this.locale);
  static DemoLocalization? of(context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization);
  }

   Map<String, String>? _localizationValues;

  Future<bool> load() async {
    String jsonStringValues =
        await rootBundle.loadString('lib/language/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizationValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

   String? getTranslatedValue(String key) {
    return _localizationValues![key];
  }

  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationDelegate();
}

class _DemoLocalizationDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization localization = DemoLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationDelegate old) {
    return false;
  }
}

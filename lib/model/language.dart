import 'package:alamal/controller/constant.dart';

class Language {
  final int id;
  final String name;
  final String fontFamily;
  final String languageCode;

  Language(this.id, this.name, this.languageCode, this.fontFamily);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', 'en', poppinsMedium),
      Language(2, 'العربية', 'ar', tajawalMedium),
    ];
  }
}

import 'package:intl/intl.dart';

List<Map<String, dynamic>> languages = [
  {
    "name": "العربية",
    "image": 'assets/images/Arabic.svg',
    "shortName": "ar",
    "code": "ar",
  },
  {
    "name": "English",
    "image": 'assets/images/English.svg',
    "shortName": "en",
    "code": "en",
  },
];

String getCurrentLanguageCode() {
  return Intl.getCurrentLocale();
}

String getCurrentLanguageName() {
  return languages.firstWhere(
    (language) => language['code'] == getCurrentLanguageCode(),
    orElse: () => {'name': 'Unknown'},
  )['name'];
}

int getCurrentIndexOfLanguage() {
  return languages.indexWhere(
    (language) => language['code'] == getCurrentLanguageCode(),
  );
}

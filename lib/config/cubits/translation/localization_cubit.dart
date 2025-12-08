import 'dart:ui';

import 'package:rahma_project/core/helpers/shared_prefs_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ar')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final languageCode =
        await SharedPrefsHelper.getString('languageCode') ?? 'ar';
    final supportedLocales = ['en', 'ar'];
    if (!supportedLocales.contains(languageCode)) {
      emit(const Locale('ar'));
      return;
    } else {
      emit(Locale(languageCode));
    }
  }

  String getLocale() {
    return Intl.getCurrentLocale();
  }

  Future<void> setLocale(Locale locale) async {
    emit(locale);
    await SharedPrefsHelper.setData('languageCode', locale.languageCode);
  }

  Future<void> toggleLocale() async {
    final currentLocale = state.languageCode;
    final newLocale = currentLocale == 'en'
        ? const Locale('ar')
        : const Locale('en');
    emit(newLocale);
    await SharedPrefsHelper.setData('languageCode', newLocale.languageCode);
  }
}

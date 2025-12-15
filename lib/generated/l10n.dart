// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Rahma`
  String get app_name {
    return Intl.message('Rahma', name: 'app_name', desc: '', args: []);
  }

  /// `Next Prayer`
  String get next_prayer {
    return Intl.message('Next Prayer', name: 'next_prayer', desc: '', args: []);
  }

  /// `Fajr`
  String get fajr {
    return Intl.message('Fajr', name: 'fajr', desc: '', args: []);
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message('Sunrise', name: 'sunrise', desc: '', args: []);
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message('Dhuhr', name: 'dhuhr', desc: '', args: []);
  }

  /// `Asr`
  String get asr {
    return Intl.message('Asr', name: 'asr', desc: '', args: []);
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message('Maghrib', name: 'maghrib', desc: '', args: []);
  }

  /// `Isha`
  String get isha {
    return Intl.message('Isha', name: 'isha', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Prayer Times`
  String get prayer_times {
    return Intl.message(
      'Prayer Times',
      name: 'prayer_times',
      desc: '',
      args: [],
    );
  }

  /// `Update with Current Location`
  String get update_prayer_times {
    return Intl.message(
      'Update with Current Location',
      name: 'update_prayer_times',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Location Changed`
  String get location_changed {
    return Intl.message(
      'Location Changed',
      name: 'location_changed',
      desc: '',
      args: [],
    );
  }

  /// `Your location has changed. Do you want to update prayer times for the new location?`
  String get location_changed_message {
    return Intl.message(
      'Your location has changed. Do you want to update prayer times for the new location?',
      name: 'location_changed_message',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Azkar`
  String get azkar {
    return Intl.message('Azkar', name: 'azkar', desc: '', args: []);
  }

  /// `Qibla`
  String get qibla {
    return Intl.message('Qibla', name: 'qibla', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Quraan`
  String get quraan {
    return Intl.message('Quraan', name: 'quraan', desc: '', args: []);
  }

  /// `Repeat {count}`
  String repeat(Object count) {
    return Intl.message(
      'Repeat $count',
      name: 'repeat',
      desc: '',
      args: [count],
    );
  }

  /// `Rotate to align the arrows`
  String get rotate_to_align_arrows {
    return Intl.message(
      'Rotate to align the arrows',
      name: 'rotate_to_align_arrows',
      desc: '',
      args: [],
    );
  }

  /// `Aligned with Qibla ✓`
  String get aligned_with_qibla {
    return Intl.message(
      'Aligned with Qibla ✓',
      name: 'aligned_with_qibla',
      desc: '',
      args: [],
    );
  }

  /// `Qibla: {angle}°`
  String quibla_angle(Object angle) {
    return Intl.message(
      'Qibla: $angle°',
      name: 'quibla_angle',
      desc: '',
      args: [angle],
    );
  }

  /// `Off {angle}°`
  String off_angle(Object angle) {
    return Intl.message(
      'Off $angle°',
      name: 'off_angle',
      desc: '',
      args: [angle],
    );
  }

  /// `Copied to clipboard`
  String get copied_to_clipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copied_to_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Tasabeeh`
  String get tasabeeh {
    return Intl.message('Tasabeeh', name: 'tasabeeh', desc: '', args: []);
  }

  /// `Tasbeeh: {count}`
  String your_tasbeeh_count(Object count) {
    return Intl.message(
      'Tasbeeh: $count',
      name: 'your_tasbeeh_count',
      desc: '',
      args: [count],
    );
  }

  /// `Added Tasbeeh`
  String get added_tasbeeh {
    return Intl.message(
      'Added Tasbeeh',
      name: 'added_tasbeeh',
      desc: '',
      args: [],
    );
  }

  /// `Reset Tasbeeh`
  String get reset_tasbeeh {
    return Intl.message(
      'Reset Tasbeeh',
      name: 'reset_tasbeeh',
      desc: '',
      args: [],
    );
  }

  /// `Delete Tasbeeh`
  String get delete_tasbeeh {
    return Intl.message(
      'Delete Tasbeeh',
      name: 'delete_tasbeeh',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this tasbeeh?`
  String get confirm_delete_tasbeeh {
    return Intl.message(
      'Are you sure you want to delete this tasbeeh?',
      name: 'confirm_delete_tasbeeh',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Add Tasbehah`
  String get add_tasbehah {
    return Intl.message(
      'Add Tasbehah',
      name: 'add_tasbehah',
      desc: '',
      args: [],
    );
  }

  /// `Tasbehah`
  String get tasbehah {
    return Intl.message('Tasbehah', name: 'tasbehah', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Enter your tasbehah...`
  String get enter_tasbehah_hint {
    return Intl.message(
      'Enter your tasbehah...',
      name: 'enter_tasbehah_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter description...`
  String get enter_tasbehah_description {
    return Intl.message(
      'Enter description...',
      name: 'enter_tasbehah_description',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Tasbeeh deleted`
  String get tasbeeh_deleted {
    return Intl.message(
      'Tasbeeh deleted',
      name: 'tasbeeh_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Tasbeeh updated`
  String get tasbeeh_updated {
    return Intl.message(
      'Tasbeeh updated',
      name: 'tasbeeh_updated',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

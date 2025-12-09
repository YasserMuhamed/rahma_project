// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(angle) => "بعيد ${angle}°";

  static String m1(angle) => "القبلة: ${angle}°";

  static String m2(count) => "تكرار ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aligned_with_qibla": MessageLookupByLibrary.simpleMessage(
      "متوافق مع القبلة ✓",
    ),
    "app_name": MessageLookupByLibrary.simpleMessage("رحمة"),
    "asr": MessageLookupByLibrary.simpleMessage("العصر"),
    "azkar": MessageLookupByLibrary.simpleMessage("أذكار"),
    "cancel": MessageLookupByLibrary.simpleMessage("الغاء"),
    "dhuhr": MessageLookupByLibrary.simpleMessage("الظهر"),
    "fajr": MessageLookupByLibrary.simpleMessage("الفجر"),
    "isha": MessageLookupByLibrary.simpleMessage("العشاء"),
    "loading": MessageLookupByLibrary.simpleMessage("جار التحميل..."),
    "location_changed": MessageLookupByLibrary.simpleMessage("تغير الموقع"),
    "location_changed_message": MessageLookupByLibrary.simpleMessage(
      "لقد تغير موقعك. هل ترغب في تحديث مواقيت الصلاة للموقع الجديد؟",
    ),
    "maghrib": MessageLookupByLibrary.simpleMessage("المغرب"),
    "next_prayer": MessageLookupByLibrary.simpleMessage("الصلاة التالية"),
    "off_angle": m0,
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "prayer_times": MessageLookupByLibrary.simpleMessage("مواقيت الصلاة"),
    "previous": MessageLookupByLibrary.simpleMessage("السابق"),
    "qibla": MessageLookupByLibrary.simpleMessage("القبلة"),
    "quibla_angle": m1,
    "quraan": MessageLookupByLibrary.simpleMessage("القرآن"),
    "repeat": m2,
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "rotate_to_align_arrows": MessageLookupByLibrary.simpleMessage(
      "قم بالتدوير لمزامنة الأسهم",
    ),
    "services": MessageLookupByLibrary.simpleMessage("الخدمات"),
    "sunrise": MessageLookupByLibrary.simpleMessage("الشروق"),
    "update_prayer_times": MessageLookupByLibrary.simpleMessage(
      "تحديث بالموقع الحالي",
    ),
  };
}

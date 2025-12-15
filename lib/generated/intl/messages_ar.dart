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

  static String m3(count) => "تسابيحك: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add": MessageLookupByLibrary.simpleMessage("إضافة"),
    "add_tasbehah": MessageLookupByLibrary.simpleMessage("إضافة تسبيحة"),
    "added_tasbeeh": MessageLookupByLibrary.simpleMessage("تمت إضافة تسبيحة"),
    "aligned_with_qibla": MessageLookupByLibrary.simpleMessage(
      "متوافق مع القبلة ✓",
    ),
    "app_name": MessageLookupByLibrary.simpleMessage("رحمة"),
    "asr": MessageLookupByLibrary.simpleMessage("العصر"),
    "azkar": MessageLookupByLibrary.simpleMessage("أذكار"),
    "cancel": MessageLookupByLibrary.simpleMessage("الغاء"),
    "confirm_delete_tasbeeh": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد حذف هذه التسبيحة؟",
    ),
    "copied_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "تم النسخ إلى الحافظة",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "delete_tasbeeh": MessageLookupByLibrary.simpleMessage("حذف التسبيح"),
    "description": MessageLookupByLibrary.simpleMessage("الوصف"),
    "dhuhr": MessageLookupByLibrary.simpleMessage("الظهر"),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "enter_tasbehah_description": MessageLookupByLibrary.simpleMessage(
      "اكتب الوصف...",
    ),
    "enter_tasbehah_hint": MessageLookupByLibrary.simpleMessage(
      "اكتب تسبيحتك...",
    ),
    "fajr": MessageLookupByLibrary.simpleMessage("الفجر"),
    "isha": MessageLookupByLibrary.simpleMessage("العشاء"),
    "loading": MessageLookupByLibrary.simpleMessage("جار التحميل..."),
    "location_changed": MessageLookupByLibrary.simpleMessage("تغير الموقع"),
    "location_changed_message": MessageLookupByLibrary.simpleMessage(
      "لقد تغير موقعك. هل ترغب في تحديث مواقيت الصلاة للموقع الجديد؟",
    ),
    "maghrib": MessageLookupByLibrary.simpleMessage("المغرب"),
    "next_prayer": MessageLookupByLibrary.simpleMessage("الصلاة التالية"),
    "no": MessageLookupByLibrary.simpleMessage("لا"),
    "off_angle": m0,
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "prayer_times": MessageLookupByLibrary.simpleMessage("مواقيت الصلاة"),
    "previous": MessageLookupByLibrary.simpleMessage("السابق"),
    "qibla": MessageLookupByLibrary.simpleMessage("القبلة"),
    "quibla_angle": m1,
    "quraan": MessageLookupByLibrary.simpleMessage("القرآن"),
    "repeat": m2,
    "reset_tasbeeh": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين التسبيح",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "rotate_to_align_arrows": MessageLookupByLibrary.simpleMessage(
      "قم بالتدوير لمزامنة الأسهم",
    ),
    "services": MessageLookupByLibrary.simpleMessage("الخدمات"),
    "sunrise": MessageLookupByLibrary.simpleMessage("الشروق"),
    "tasabeeh": MessageLookupByLibrary.simpleMessage("تسابيح"),
    "tasbeeh_deleted": MessageLookupByLibrary.simpleMessage("تم حذف التسبيحة"),
    "tasbeeh_updated": MessageLookupByLibrary.simpleMessage(
      "تم تحديث التسبيحة",
    ),
    "tasbehah": MessageLookupByLibrary.simpleMessage("التسبيحة"),
    "update_prayer_times": MessageLookupByLibrary.simpleMessage(
      "تحديث بالموقع الحالي",
    ),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
    "your_tasbeeh_count": m3,
  };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(angle) => "Off ${angle}°";

  static String m1(angle) => "Qibla: ${angle}°";

  static String m2(count) => "Repeat ${count}";

  static String m3(count) => "Tasbeeh: ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "add_tasbehah": MessageLookupByLibrary.simpleMessage("Add Tasbehah"),
    "added_tasbeeh": MessageLookupByLibrary.simpleMessage("Added Tasbeeh"),
    "aligned_with_qibla": MessageLookupByLibrary.simpleMessage(
      "Aligned with Qibla ✓",
    ),
    "app_name": MessageLookupByLibrary.simpleMessage("Rahma"),
    "asr": MessageLookupByLibrary.simpleMessage("Asr"),
    "azkar": MessageLookupByLibrary.simpleMessage("Azkar"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "confirm_delete_tasbeeh": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this tasbeeh?",
    ),
    "copied_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "delete_tasbeeh": MessageLookupByLibrary.simpleMessage("Delete Tasbeeh"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "dhuhr": MessageLookupByLibrary.simpleMessage("Dhuhr"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "enter_tasbehah_description": MessageLookupByLibrary.simpleMessage(
      "Enter description...",
    ),
    "enter_tasbehah_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your tasbehah...",
    ),
    "fajr": MessageLookupByLibrary.simpleMessage("Fajr"),
    "isha": MessageLookupByLibrary.simpleMessage("Isha"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "location_changed": MessageLookupByLibrary.simpleMessage(
      "Location Changed",
    ),
    "location_changed_message": MessageLookupByLibrary.simpleMessage(
      "Your location has changed. Do you want to update prayer times for the new location?",
    ),
    "maghrib": MessageLookupByLibrary.simpleMessage("Maghrib"),
    "next_prayer": MessageLookupByLibrary.simpleMessage("Next Prayer"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "off_angle": m0,
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "prayer_times": MessageLookupByLibrary.simpleMessage("Prayer Times"),
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "qibla": MessageLookupByLibrary.simpleMessage("Qibla"),
    "quibla_angle": m1,
    "quraan": MessageLookupByLibrary.simpleMessage("Quraan"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "repeat": m2,
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "reset_tasbeeh": MessageLookupByLibrary.simpleMessage("Reset Tasbeeh"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "rotate_to_align_arrows": MessageLookupByLibrary.simpleMessage(
      "Rotate to align the arrows",
    ),
    "services": MessageLookupByLibrary.simpleMessage("Services"),
    "sunrise": MessageLookupByLibrary.simpleMessage("Sunrise"),
    "tasabeeh": MessageLookupByLibrary.simpleMessage("Tasabeeh"),
    "tasbeeh_deleted": MessageLookupByLibrary.simpleMessage("Tasbeeh deleted"),
    "tasbeeh_reset": MessageLookupByLibrary.simpleMessage("Tasbeeh reset"),
    "tasbeeh_reset_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to reset the tasbeeh count?",
    ),
    "tasbeeh_updated": MessageLookupByLibrary.simpleMessage("Tasbeeh updated"),
    "tasbehah": MessageLookupByLibrary.simpleMessage("Tasbehah"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "update_prayer_times": MessageLookupByLibrary.simpleMessage(
      "Update with Current Location",
    ),
    "using_cached_data": MessageLookupByLibrary.simpleMessage(
      "Using cached data",
    ),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "your_tasbeeh_count": m3,
  };
}

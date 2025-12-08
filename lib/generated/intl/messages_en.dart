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

  static String m0(count) => "Repeat ${count}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_name": MessageLookupByLibrary.simpleMessage("Rahma"),
    "asr": MessageLookupByLibrary.simpleMessage("Asr"),
    "azkar": MessageLookupByLibrary.simpleMessage("Azkar"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "dhuhr": MessageLookupByLibrary.simpleMessage("Dhuhr"),
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
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "prayer_times": MessageLookupByLibrary.simpleMessage("Prayer Times"),
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "qibla": MessageLookupByLibrary.simpleMessage("Qibla"),
    "quraan": MessageLookupByLibrary.simpleMessage("Quraan"),
    "repeat": m0,
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "services": MessageLookupByLibrary.simpleMessage("Services"),
    "sunrise": MessageLookupByLibrary.simpleMessage("Sunrise"),
    "update_prayer_times": MessageLookupByLibrary.simpleMessage(
      "Update with Current Location",
    ),
  };
}

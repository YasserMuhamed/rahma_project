import 'package:flutter/material.dart';

class TFormatter {
  static String formatTime(String dateTime, BuildContext context) {
    final date = DateTime.tryParse(dateTime) ?? DateTime.now();
    return TimeOfDay.fromDateTime(date).format(context);
  }

  static String timeDifference(DateTime date) =>
      date.difference(DateTime.now()).inMinutes.toString();
}

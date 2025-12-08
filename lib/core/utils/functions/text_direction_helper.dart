import 'package:flutter/material.dart';

class TextDirectionHelper {
  /// Detects if text contains Arabic characters
  static bool isArabic(String text) {
    if (text.isEmpty) return false;

    // Arabic Unicode range: U+0600 to U+06FF
    // Arabic Supplement: U+0750 to U+077F
    // Arabic Extended-A: U+08A0 to U+08FF
    final arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]');

    return arabicRegex.hasMatch(text);
  }

  /// Detects the text direction based on content
  static TextDirection getTextDirection(String text) {
    return isArabic(text) ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Gets appropriate alignment based on text direction
  static CrossAxisAlignment getAlignment(String text, {bool isSender = false}) {
    final isRtl = isArabic(text);

    if (isSender) {
      // Sender messages align to the end (right for LTR, left for RTL)
      return isRtl ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    } else {
      // Receiver messages align to the start (left for LTR, right for RTL)
      return isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    }
  }

  /// Gets text alignment based on direction
  static TextAlign getTextAlign(String text) {
    return isArabic(text) ? TextAlign.right : TextAlign.left;
  }
}

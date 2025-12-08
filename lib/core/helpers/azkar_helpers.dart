import 'package:rahma_project/features/azkar/domain/entities/azkar_entity.dart';

extension AzkarContentFormatter on String {
  // Replace verse numbers (25) with Islamic ayah symbol ﴿ ٢٥ ﴾
  String toIslamicAyahFormat({bool fixCommas = false}) {
    // Arabic-Indic numerals (٠-٩)
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    // Convert Western digits to Arabic-Indic
    String convertToArabicNumeral(String number) {
      return number.split('').map((char) {
        int? digit = int.tryParse(char);
        return digit != null ? arabicNumerals[digit] : char;
      }).join();
    }

    // Replace all occurrences of (number) with ﴿ arabicNumber ﴾
    String result = replaceAllMapped(RegExp(r'\((\d+)\)'), (match) {
      String number = match.group(1)!;
      String arabicNumber = convertToArabicNumeral(number);
      return arabicNumber;
    });

    // Optionally fix Arabic comma if font doesn't support it
    if (fixCommas) {
      result = result.replaceAll('،', ',');
    }

    return result;
  }

  // Alternative: Use only the ayah symbol ۝ with number
  String toSimpleAyahFormat() {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String convertToArabicNumeral(String number) {
      return number.split('').map((char) {
        int? digit = int.tryParse(char);
        return digit != null ? arabicNumerals[digit] : char;
      }).join();
    }

    return replaceAllMapped(RegExp(r'\((\d+)\)'), (match) {
      String number = match.group(1)!;
      String arabicNumber = convertToArabicNumeral(number);
      return '۝$arabicNumber';
    });
  }

  // Circular ayah symbol format
  String toCircularAyahFormat() {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String convertToArabicNumeral(String number) {
      return number.split('').map((char) {
        int? digit = int.tryParse(char);
        return digit != null ? arabicNumerals[digit] : char;
      }).join();
    }

    return replaceAllMapped(RegExp(r'\((\d+)\)'), (match) {
      String number = match.group(1)!;
      String arabicNumber = convertToArabicNumeral(number);
      return '⊙ $arabicNumber ⊙';
    });
  }
}

// Usage in your AzkarEntity or UI widget
class AzkarDisplayHelper {
  static String formatContent(String content) {
    // Use one of the formatting methods:
    return content.toIslamicAyahFormat(fixCommas: true); // ﴿٢٥﴾
    // return content.toSimpleAyahFormat(); // ۝٢٥
    // return content.toCircularAyahFormat(); // ⊙ ٢٥ ⊙
  }
}

extension AzkarEntityExtension on AzkarEntity {
  String get formattedContent => content.toIslamicAyahFormat(fixCommas: true);
}

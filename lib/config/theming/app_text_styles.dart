import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base style to reuse common properties
  static TextStyle _style({
    required FontWeight fontWeight,
    required double fontSize,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ==================== W400: REGULAR/NORMAL ====================

  static TextStyle w400_10({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 10, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_12({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 12, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_14({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 14, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_16({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 16, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_18({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 18, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_20({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 20, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_24({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 24, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_28({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 28, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_32({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 32, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w400_36({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w400, fontSize: 36, color: color, height: height, letterSpacing: letterSpacing);

  // ==================== W500: MEDIUM ====================

  static TextStyle w500_10({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 10, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_12({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 12, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_14({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 14, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_16({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 16, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_18({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 18, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_20({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 20, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_24({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 24, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_28({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 28, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_32({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 32, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w500_36({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w500, fontSize: 36, color: color, height: height, letterSpacing: letterSpacing);

  // ==================== W600: SEMI-BOLD ====================

  static TextStyle w600_10({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 10, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_12({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 12, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_14({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 14, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_16({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 16, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_18({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 18, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_20({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 20, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_24({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 24, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_28({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 28, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_32({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 32, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w600_36({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w600, fontSize: 36, color: color, height: height, letterSpacing: letterSpacing);

  // ==================== W700: BOLD ====================

  static TextStyle w700_10({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 10, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_12({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 12, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_14({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 14, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_16({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 16, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_18({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 18, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_20({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 20, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_24({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 24, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_28({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 28, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_32({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 32, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w700_36({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w700, fontSize: 36, color: color, height: height, letterSpacing: letterSpacing);

  // ==================== W800: EXTRA BOLD ====================

  static TextStyle w800_12({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 12, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_14({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 14, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_16({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 16, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_18({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 18, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_20({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 20, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_24({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 24, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_28({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 28, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_32({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 32, color: color, height: height, letterSpacing: letterSpacing);

  static TextStyle w800_36({Color? color, double? height, double? letterSpacing}) =>
      _style(fontWeight: FontWeight.w800, fontSize: 36, color: color, height: height, letterSpacing: letterSpacing);

  // ==================== SEMANTIC TEXT STYLES ====================

  /// Display - Large hero text (32-36sp)
  static TextStyle displayLarge({Color? color}) => w700_36(color: color);
  static TextStyle displayMedium({Color? color}) => w700_32(color: color);
  static TextStyle displaySmall({Color? color}) => w700_28(color: color);

  /// Headline - Section headers (24-28sp)
  static TextStyle headlineLarge({Color? color}) => w600_28(color: color);
  static TextStyle headlineMedium({Color? color}) => w600_24(color: color);
  static TextStyle headlineSmall({Color? color}) => w600_20(color: color);

  /// Title - Card titles, list items (16-20sp)
  static TextStyle titleLarge({Color? color}) => w600_20(color: color);
  static TextStyle titleMedium({Color? color}) => w600_18(color: color);
  static TextStyle titleSmall({Color? color}) => w600_16(color: color);

  /// Body - Main content text (14-16sp)
  static TextStyle bodyLarge({Color? color}) => w400_16(color: color, height: 1.5);
  static TextStyle bodyMedium({Color? color}) => w400_14(color: color, height: 1.5);
  static TextStyle bodySmall({Color? color}) => w400_12(color: color, height: 1.5);

  /// Label - Button text, labels (12-14sp)
  static TextStyle labelLarge({Color? color}) => w500_14(color: color, letterSpacing: 0.1);
  static TextStyle labelMedium({Color? color}) => w500_12(color: color, letterSpacing: 0.5);
  static TextStyle labelSmall({Color? color}) => w500_10(color: color, letterSpacing: 0.5);

  // ==================== E-COMMERCE SPECIFIC STYLES ====================

  /// Product title in cards
  static TextStyle productTitle({Color? color}) => w600_16(color: color);

  /// Product price
  static TextStyle productPrice({Color? color}) => w700_20(color: color);

  /// Original price (strikethrough)
  static TextStyle productPriceOriginal({Color? color}) => w400_14(color: color).copyWith(decoration: TextDecoration.lineThrough);

  /// Product description
  static TextStyle productDescription({Color? color}) => w400_14(color: color, height: 1.5);

  /// Badge text (SALE, NEW, etc.)
  static TextStyle badgeText({Color? color}) => w700_10(color: color, letterSpacing: 0.5);

  /// Button text
  static TextStyle buttonText({Color? color}) => w600_16(color: color, letterSpacing: 0.2);

  /// Small button text
  static TextStyle buttonTextSmall({Color? color}) => w600_14(color: color, letterSpacing: 0.2);

  /// App bar title
  static TextStyle appBarTitle({Color? color}) => w600_20(color: color, letterSpacing: -0.5);

  /// Section title
  static TextStyle sectionTitle({Color? color}) => w600_18(color: color);

  /// Caption/Helper text
  static TextStyle caption({Color? color}) => w400_12(color: color, height: 1.5);

  /// Link text
  static TextStyle linkText({Color? color}) => w500_14(color: color).copyWith(decoration: TextDecoration.underline);
}

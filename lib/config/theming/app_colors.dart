import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // static const Color vibrantEmerald = Color(0xFF1F7D53);
  // static const Color forestGreen = Color(0xFF255F38);
  // static const Color hunterGreen = Color(0xFF27391C);
  // static const Color pineNeedle = Color(0xFF18230F);
  // static const Color pureWhite = Color(0xFFFFFFFF);
  // static const Color lightText = Color(0xFFE8E8E8);

  // static const Color vibrantEmerald = Color(0xFF1E90FF); // vibrant electric blue
  // static const Color forestGreen = Color(0xFF1565C0); // deep ocean blue
  // static const Color hunterGreen = Color(0xFF0D47A1); // navy / royal blue
  // static const Color pineNeedle = Color(0xFF082A4C); // dark midnight blue
  // static const Color pureWhite = Color(0xFFFFFFFF); // unchanged white
  // static const Color lightText = Color(0xFFE0F2FF); // very light icy blue

  // static const Color vibrantEmerald = Color(0xFFB87333); // copper brown
  // static const Color forestGreen = Color(0xFF8B5A2B); // classic brown
  // static const Color hunterGreen = Color(0xFF5C3A21); // dark roasted brown
  // static const Color pineNeedle = Color(0xFF3B2414); // deep espresso brown
  // static const Color pureWhite = Color(0xFFFFFFFF); // keep white
  // static const Color lightText = Color(0xFFEDE3D6); // soft beige / sand

  // static const Color vibrantEmerald = Color(0xFF6E4B2A); // rich walnut brown
  // static const Color forestGreen = Color(0xFF4B2E14); // strong dark brown
  // static const Color hunterGreen = Color(0xFF2F1B0C); // roasted espresso brown
  // static const Color pineNeedle = Color(0xFF1A0E05); // near-black dark brown
  // static const Color pureWhite = Color(0xFFFFFFFF); // unchanged white
  // static const Color lightText = Color(0xFFD5C7B8); // light warm sand for contrast

  static const Color vibrantEmerald = Color(0xFF1E3A8A); // bright royal blue
  static const Color forestGreen = Color(0xFF162E6C); // deep sapphire blue
  static const Color hunterGreen = Color(0xFF0F1F4D); // dark navy blue
  static const Color pineNeedle = Color(0xFF0A132B); // near-black midnight blue
  static const Color pureWhite = Color(0xFFFFFFFF); // pure white for contrast
  static const Color lightText = Color(0xFFB0C4DE); // soft light steel blue

  // static const Color vibrantEmerald = Color(0xFF6A0DAD); // vivid deep violet
  // static const Color forestGreen = Color(0xFF4B0082); // rich dark purple
  // static const Color hunterGreen = Color(0xFF330055); // very dark purple
  // static const Color pineNeedle = Color(0xFF1A001F); // near-black violet
  // static const Color pureWhite = Color(0xFFFFFFFF); // pure white for contrast
  // static const Color lightText = Color(0xFFBDA0FF); // soft lavender for text

  // static const Color vibrantEmerald = Color(0xFF8E6A21); // dark golden highlight
  // static const Color forestGreen = Color(0xFF6A4F18); // deep rich matte gold
  // static const Color hunterGreen = Color(0xFF4B370F); // dark antique gold
  // static const Color pineNeedle = Color(0xFF2B1F08); // near-black brownish gold
  // static const Color pureWhite = Color(0xFFFFFFFF); // pure white for contrast
  // static const Color lightText = Color(0xFFE5D8B5); // soft pale gold text
  // ==================== PRIMARY COLORS ====================
  // Bright Blue - Most used for CTAs, buttons, links
  static const Color primaryBlue = Color(0xFF0A84FF); // iOS Blue / Bright Blue
  static const Color primaryBlueDark = Color(0xFF0A84FF); // Same vibrant blue for dark mode

  // ==================== SECONDARY/ACCENT COLORS ====================
  static const Color successGreen = Color(0xFF34C759); // iOS Green - checkmarks, success
  static const Color warningAmber = Color(0xFFFFCC00); // Yellow/Amber - highlights, ratings

  // ==================== BACKGROUND COLORS ====================
  // Light Mode
  static const Color backgroundLight = Color(0xFFF5F5F5); // Light gray background
  static const Color surfaceLight = Color(0xFFFFFFFF); // Pure white cards
  static const Color cardLight = Color(0xFFFFFFFF);

  // Dark Mode
  static const Color backgroundDark = Color(0xFF121212); // True black
  static const Color surfaceDark = Color(0xFF121212); // Dark gray cards
  static const Color cardDark = Color(0xFF1e1e1e); // Slightly lighter cards

  // ==================== TEXT COLORS ====================
  // Light Mode - MOST USED for descriptions/body text
  static const Color textPrimaryLight = Color(0xFF000000); // Pure black
  static const Color textSecondaryLight = Color(0xFF8E8E93); // Gray - descriptions, labels
  static const Color textTertiaryLight = Color(0xFFC7C7CC); // Light gray - placeholders

  // Dark Mode
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // Pure white
  static const Color textSecondaryDark = Color(0xFF8E8E93); // Gray - same as light mode
  static const Color textTertiaryDark = Color(0xFF48484A); // Dark gray

  // ==================== BORDER & DIVIDER COLORS ====================
  // Light Mode
  static const Color borderLight = Color(0xFFE5E5EA); // Light gray borders
  static const Color dividerLight = Color(0xFFE5E5EA);

  // Dark Mode
  static const Color borderDark = Color(0xFF38383A); // Dark borders
  static const Color dividerDark = Color(0xFF38383A);

  // ==================== STATUS COLORS ====================
  static const Color success = Color(0xFF34C759); // Green
  static const Color error = Color(0xFFFF3B30); // Red
  static const Color warning = Color(0xFFFFCC00); // Yellow
  static const Color info = Color(0xFF0A84FF); // Blue

  // ==================== RATING STARS ====================
  static const Color starYellow = Color(0xFFFFCC00); // Yellow stars
  static const Color starGray = Color(0xFFE5E5EA); // Unfilled stars light
  static const Color starGrayDark = Color(0xFF48484A); // Unfilled stars dark

  // ==================== E-COMMERCE SPECIFIC ====================
  static const Color priceBlue = Color(0xFF0A84FF); // Price in blue
  static const Color discountRed = Color(0xFFFF3B30); // Discount/sale
  static const Color badgeBlue = Color(0xFF0A84FF); // Trending badges

  // ==================== CHIP/TAG COLORS ====================
  static const Color chipBackgroundLight = Color(0xFFE5E5EA);
  static const Color chipBackgroundDark = Color(0xFF2C2C2E);
  static const Color chipSelectedLight = Color(0xFFD1E8FF); // Light blue tint
  static const Color chipSelectedDark = Color(0xFF1C3A52); // Dark blue tint

  // ==================== OVERLAY & SHADOW ====================
  static const Color overlayLight = Color(0x0A000000);
  static const Color overlayDark = Color(0x14FFFFFF);
  static const Color shadowLight = Color(0x14000000);
  static const Color shadowDark = Color(0x29000000);

  // ==================== ICON COLORS ====================
  static const Color iconLight = Color(0xFF000000);
  static const Color iconSecondaryLight = Color(0xFF8E8E93);
  static const Color iconDark = Color(0xFFFFFFFF);
  static const Color iconSecondaryDark = Color(0xFF8E8E93);

  // ==================== SEARCH BAR ====================
  static const Color searchBackgroundLight = Color.fromARGB(255, 231, 231, 231);
  static const Color searchBackgroundDark = Color(0xFF1C1C1E);
  static const Color searchTextLight = Color(0xFF000000);
  static const Color searchTextDark = Color(0xFFFFFFFF);
  static const Color searchPlaceholderLight = Color(0xFF8E8E93);
  static const Color searchPlaceholderDark = Color(0xFF8E8E93);
}

// [old]

// import 'package:flutter/material.dart';

// class AppColors {
//   static const Color primary = Color(0xFF21409A);
//   static const Color secondary = Color(0xFFF68B1F);
//   static const Color background = Color(0xFFFFFFFF);
//   static const Color orange200 = Color(0xFFFBC58F);
//   static const Color orange600 = Color(0xFFC56F19);
//   static const Color primaryText = Color(0xFFFFFFFF);
//   static const Color primary400Text = Color(0xFFE9ECF5);
//   static const Color black100 = Color(0xFF333333);
//   static const Color black200 = Color(0xFF5B5B5B);
//   static const Color black300 = Color(0xFF848484);
//   static const Color black600 = Color(0xFF282828);
//   static const Color lightGray100 = Color(0xFFF4F4F4);
//   static const Color lightGray200 = Color(0xFFF7F7F7);
//   static const Color lightGray500 = Color(0xFFC1C1C1);
//   static const Color black = Color(0xFF000000);
//   static const Color red = Color(0xFFEB5757);
//   static const Color deepRed = Color.fromARGB(255, 148, 28, 28);
//   static const Color green = Color(0xffe44974b);

//   static const Color lightBlue = Color.fromRGBO(233, 236, 245, 1);
//   static const Color blue = Color.fromRGBO(0, 132, 255, 0.3);
//   static const Color lightGray = Color(0xFFF2F2F2);
//   static const Color success100 = Color(0xFFEBF7EC);
//   static const Color success500 = Color(0xFF4BB450);
//   static const Color success = Color(0xFF43A047);
//   static const Color green300 = Color(0xFFB7DFB9);
//   static const Color error400 = Color(0xFFE8534F);
// }

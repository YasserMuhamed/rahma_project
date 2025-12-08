import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rahma_project/config/theming/app_colors.dart';

class DarkEarthyTheme {
  // Color definitions
  static const Color vibrantEmerald = Color(0xFF1F7D53);
  static const Color forestGreen = Color(0xFF255F38);
  static const Color hunterGreen = Color(0xFF27391C);
  static const Color pineNeedle = Color(0xFF18230F);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFFE8E8E8);

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

  // Theme data
  static ThemeData get themeData {
    return ThemeData(
      fontFamily: "Almarai",
      // Core theme properties
      brightness: Brightness.dark,
      primaryColor: vibrantEmerald,
      primaryColorDark: forestGreen,
      primaryColorLight: vibrantEmerald.withOpacity(0.8),

      // ColorScheme - the modern way to define colors
      colorScheme: const ColorScheme.dark(
        primary: vibrantEmerald,
        secondary: forestGreen,
        surface: pineNeedle, // Main app background
        onPrimary: pureWhite,
        onSecondary: pureWhite,
        onSurface: lightText,
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: pineNeedle,
        foregroundColor: pureWhite,
        elevation: 2,
        titleTextStyle: TextStyle(color: pureWhite, fontSize: 20, fontWeight: FontWeight.w600),
      ),

      // Scaffold background
      scaffoldBackgroundColor: pineNeedle,

      // Card theme
      cardTheme: const CardThemeData(
        color: hunterGreen,
        elevation: 1,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: vibrantEmerald,
          foregroundColor: pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: vibrantEmerald,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: forestGreen,
          side: const BorderSide(color: forestGreen),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Input decoration theme (TextFields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: hunterGreen.withOpacity(0.7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: vibrantEmerald, width: 2),
        ),
        labelStyle: const TextStyle(color: lightText),
        hintStyle: TextStyle(color: lightText.withOpacity(0.7)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // Icon theme
      iconTheme: const IconThemeData(color: lightText),

      // Divider theme
      dividerTheme: const DividerThemeData(color: forestGreen, thickness: 1, space: 1),

      // Floating Action Button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: vibrantEmerald, foregroundColor: pureWhite),

      // Bottom Navigation Bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: pineNeedle,
        selectedItemColor: vibrantEmerald,
        unselectedItemColor: lightText,
        showUnselectedLabels: true,
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: hunterGreen,
        selectedColor: vibrantEmerald,
        labelStyle: const TextStyle(color: lightText),
        secondaryLabelStyle: const TextStyle(color: pureWhite),
        brightness: Brightness.dark,
      ),
    );
  }
}

class AppTheme {
  AppTheme._();

  // ==================== LIGHT THEME ====================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryBlue,
        secondary: AppColors.successGreen,
        tertiary: AppColors.warningAmber,
        surface: AppColors.surfaceLight,
        surfaceTint: Colors.transparent,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Color(0xFF000000),
        onSurface: AppColors.textPrimaryLight,
        onSurfaceVariant: AppColors.textSecondaryLight,
        onError: Colors.white,
        outline: AppColors.borderLight,
        outlineVariant: AppColors.dividerLight,
        shadow: AppColors.shadowLight,
        scrim: Colors.black54,
        inverseSurface: AppColors.surfaceDark,
        onInverseSurface: AppColors.textPrimaryDark,
        inversePrimary: AppColors.primaryBlueDark,
      ),

      scaffoldBackgroundColor: AppColors.backgroundLight,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.textPrimaryLight,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight, letterSpacing: -0.4),
        iconTheme: IconThemeData(color: AppColors.iconLight),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.cardLight,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.shadowLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderLight, width: 1),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme (Primary Blue)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.borderLight,
          disabledForegroundColor: AppColors.textSecondaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          disabledForegroundColor: AppColors.textSecondaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          disabledForegroundColor: AppColors.textSecondaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.borderLight,
          disabledForegroundColor: AppColors.textSecondaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.searchBackgroundLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        // Borders
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),

        // Text Styles
        labelStyle: const TextStyle(color: AppColors.textSecondaryLight, fontSize: 16),
        floatingLabelStyle: const TextStyle(color: AppColors.primaryBlue, fontSize: 16),
        hintStyle: const TextStyle(color: AppColors.searchPlaceholderLight, fontSize: 16),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),

        // Icons
        prefixIconColor: AppColors.iconSecondaryLight,
        suffixIconColor: AppColors.iconSecondaryLight,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.surfaceLight,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.iconSecondaryLight,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 80,
        backgroundColor: AppColors.surfaceLight,
        indicatorColor: AppColors.chipSelectedLight,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryBlue);
          }
          return const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.iconSecondaryLight);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryBlue, size: 24);
          }
          return const IconThemeData(color: AppColors.iconSecondaryLight, size: 24);
        }),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chipBackgroundLight,
        selectedColor: AppColors.chipSelectedLight,
        disabledColor: AppColors.borderLight,
        labelStyle: const TextStyle(color: AppColors.textPrimaryLight, fontSize: 14, fontWeight: FontWeight.w500),
        secondaryLabelStyle: const TextStyle(color: AppColors.textSecondaryLight),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        contentTextStyle: const TextStyle(fontSize: 16, color: AppColors.textSecondaryLight, height: 1.5),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: AppColors.surfaceLight,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimaryLight,
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(color: AppColors.dividerLight, thickness: 1, space: 1),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.iconLight, size: 24),

      // List Tile Theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minLeadingWidth: 40,
        iconColor: AppColors.iconSecondaryLight,
        textColor: AppColors.textPrimaryLight,
      ),
    );
  }

  // ==================== DARK THEME ====================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryBlueDark,
      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryBlueDark,
        secondary: AppColors.successGreen,
        tertiary: AppColors.warningAmber,
        surface: AppColors.surfaceDark,
        surfaceTint: Colors.transparent,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Color(0xFF000000),
        onSurface: AppColors.textPrimaryDark,
        onSurfaceVariant: AppColors.textSecondaryDark,
        onError: Colors.white,
        outline: AppColors.borderDark,
        outlineVariant: AppColors.dividerDark,
        shadow: AppColors.shadowDark,
        scrim: Colors.black87,
        inverseSurface: AppColors.surfaceLight,
        onInverseSurface: AppColors.textPrimaryLight,
        inversePrimary: AppColors.primaryBlue,
      ),

      scaffoldBackgroundColor: AppColors.backgroundDark,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundDark,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.textPrimaryDark,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark, letterSpacing: -0.4),
        iconTheme: IconThemeData(color: AppColors.iconDark),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.cardDark,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.shadowDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderDark, width: 1),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryBlueDark,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.borderDark,
          disabledForegroundColor: AppColors.textSecondaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlueDark,
          disabledForegroundColor: AppColors.textSecondaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          side: const BorderSide(color: AppColors.primaryBlueDark, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryBlueDark,
          disabledForegroundColor: AppColors.textSecondaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryBlueDark,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.borderDark,
          disabledForegroundColor: AppColors.textSecondaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(120, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.searchBackgroundDark,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        // Borders
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlueDark, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),

        // Text Styles
        labelStyle: const TextStyle(color: AppColors.textSecondaryDark, fontSize: 16),
        floatingLabelStyle: const TextStyle(color: AppColors.primaryBlueDark, fontSize: 16),
        hintStyle: const TextStyle(color: AppColors.searchPlaceholderDark, fontSize: 16),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),

        // Icons
        prefixIconColor: AppColors.iconSecondaryDark,
        suffixIconColor: AppColors.iconSecondaryDark,
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.primaryBlueDark,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.surfaceDark,
        selectedItemColor: AppColors.primaryBlueDark,
        unselectedItemColor: AppColors.iconSecondaryDark,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 80,
        backgroundColor: AppColors.surfaceDark,
        indicatorColor: AppColors.chipSelectedDark,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primaryBlueDark);
          }
          return const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.iconSecondaryDark);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryBlueDark, size: 24);
          }
          return const IconThemeData(color: AppColors.iconSecondaryDark, size: 24);
        }),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chipBackgroundDark,
        selectedColor: AppColors.chipSelectedDark,
        disabledColor: AppColors.borderDark,
        labelStyle: const TextStyle(color: AppColors.textPrimaryDark, fontSize: 14, fontWeight: FontWeight.w500),
        secondaryLabelStyle: const TextStyle(color: AppColors.textSecondaryDark),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceDark,
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
        contentTextStyle: const TextStyle(fontSize: 16, color: AppColors.textSecondaryDark, height: 1.5),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surfaceDark,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: AppColors.surfaceDark,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.cardDark,
        contentTextStyle: const TextStyle(color: AppColors.textPrimaryDark, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(color: AppColors.dividerDark, thickness: 1, space: 1),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.iconDark, size: 24),

      // List Tile Theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minLeadingWidth: 40,
        iconColor: AppColors.iconSecondaryDark,
        textColor: AppColors.textPrimaryDark,
      ),
    );
  }

  // ==================== THEME HELPERS ====================

  static Color primary(BuildContext context) => Theme.of(context).colorScheme.primary;

  static Color secondary(BuildContext context) => Theme.of(context).colorScheme.secondary;

  static Color surface(BuildContext context) => Theme.of(context).colorScheme.surface;

  static Color error(BuildContext context) => Theme.of(context).colorScheme.error;

  static Color onPrimary(BuildContext context) => Theme.of(context).colorScheme.onPrimary;

  static Color onSurface(BuildContext context) => Theme.of(context).colorScheme.onSurface;

  static Color textSecondary(BuildContext context) => Theme.of(context).colorScheme.onSurfaceVariant;

  static Color cardColor(BuildContext context) => isDarkMode(context) ? AppColors.cardDark : AppColors.cardLight;

  static bool isDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
}

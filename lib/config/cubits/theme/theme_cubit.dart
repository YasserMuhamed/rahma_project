import 'package:bloc/bloc.dart';
import 'package:rahma_project/config/theming/app_theme.dart';
import 'package:rahma_project/core/helpers/shared_prefs_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themePrefKey = 'app_theme_mode';

  ThemeCubit()
    : super(
        ThemeState(
          themeMode: AppThemeMode.system,
          lightTheme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        ),
      ) {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    try {
      final themeModeString = await SharedPrefsHelper.getString(_themePrefKey);

      if (themeModeString != null) {
        final themeMode = AppThemeMode.values.firstWhere(
          (e) => e.name == themeModeString,
          orElse: () => AppThemeMode.system,
        );
        emit(state.copyWith(themeMode: themeMode));
      }
    } catch (e) {
      debugPrint('Error loading theme preference: $e');
    }
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    try {
      await SharedPrefsHelper.setData(_themePrefKey, mode.name);
      emit(state.copyWith(themeMode: mode));
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
    }
  }

  void toggleTheme() {
    final newMode = state.themeMode == AppThemeMode.dark
        ? AppThemeMode.light
        : AppThemeMode.dark;
    setThemeMode(newMode);
  }
}

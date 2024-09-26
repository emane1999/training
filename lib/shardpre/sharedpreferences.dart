import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemingSer {
  late SharedPreferences? _prefs;
  static ThemingSer? _instance;
  static const _themeKey = 'theme';
  ThemingSer._();

  factory ThemingSer() {
    if (_instance == null) {
      throw Exception('AppSharedPrefs is not initialized. '
          'Please call AppSharedPrefs.ensureInitialized before.');
    }
    return _instance!;
  }

  ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
    _instance ??= ThemingSer._();
  }

  /// Loads the preferred theme from local storage with shared_preferences.
  /// Returns system theme initially if no theme is saved.
  ThemeMode themeMode() {
    final themeValue = _prefs?.getInt(_themeKey);
    if (themeValue == null) return ThemeMode.system;

    return ThemeMode.values[themeValue];
  }

  /// Use the shared_preferences package to persist theme settings locally.
  Future<void> updateThemeMode(ThemeMode theme) async {
    await _prefs?.setInt(_themeKey, theme.index);
  }
}

import 'package:flutter/material.dart';
import 'package:training/shardpre/sharedpreferences.dart';

import 'package:training/theme_provider/theme_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themeproivders.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  //
  @override
  ThemeState build() {
    return ThemeState(themeMode: ThemingSer().themeMode());
  }

  void setDarkTheme() {
    state = state.copyWith(themeMode: ThemeMode.dark);
  }

  void setLightTheme() {
    state = state.copyWith(themeMode: ThemeMode.light);
  }

  void setSystemTheme() {
    state = state.copyWith(themeMode: ThemeMode.system);
  }
}

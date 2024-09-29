import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'applanguagenotifier.g.dart';

@riverpod
class AppLanguageNotifier extends _$AppLanguageNotifier {
  // AppLanguageNotifier() : super(const Locale('en'));هون منع من بناء احدث خطا
  @override
  Locale build() {
    return Locale('en');
  }

  Future<void> fetchLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    if (languageCode != null) {
      state = Locale(languageCode);
    }
  }

  Future<void> changeLanguage(Locale type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state != type) {
      state = type;
      await prefs.setString('language_code', type.languageCode);
    }
  }
}

// final appLanguageProvider =
//     StateNotifierProvider<AppLanguageNotifier, Locale>((ref) {
//   final notifier = AppLanguageNotifier();
//   notifier.fetchLocale();
//   return notifier;
// });

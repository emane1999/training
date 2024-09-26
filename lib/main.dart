import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/generated/l10n.dart';
import 'package:training/shardpre/sharedpreferences.dart';
import 'package:training/splash/splash_screen.dart';
import 'package:training/theme/app_theme.dart';
import 'package:training/theme_provider/applanguagenotifier.dart';
import 'package:training/theme_provider/themeproivders.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemingSer.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(themeNotifierProvider);
    final appLocale = ref.watch(appLanguageNotifierProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: appThemeMode.themeMode,
      locale: appLocale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}

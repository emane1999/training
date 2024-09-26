import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/splash/splash_screen.dart';
import 'package:training/theme/app_theme.dart';
import 'package:training/theme_provider/themeproivders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(themeNotifierProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: appThemeMode.themeMode,
      home: const SplashScreen(),
    );
  }
}

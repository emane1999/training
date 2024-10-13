import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training/generated/l10n.dart';
import 'package:training/screen/botton_route.dart';
import 'package:training/screen/mainscreen.dart';
import 'package:training/shardpre/sharedpreferences.dart';
import 'package:training/splash/splash_screen.dart';
import 'package:training/theme/app_theme.dart';
import 'package:training/theme_provider/applanguagenotifier.dart';
import 'package:training/theme_provider/themeproivders.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemingSer.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(themeNotifierProvider);
    final appLocale = ref.watch(appLanguageNotifierProvider);
    return MaterialApp.router(
      routerConfig: _router,
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
    );
  }

  final _router = GoRouter(
    initialLocation: '/splash_screen',
    routes: [
      GoRoute(
        path: '/splash_screen',
        builder: (context, state) {
          return SplashScreen();
        },
        routes: <RouteBase>[
          // Add child routes
          GoRoute(
            path: 'mainscreen/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              // Get "id" param from URL
              return MainScreen(id: id);
            },
          ),
          GoRoute(
            path: 'botton_route',
            builder: (context, state) => BottonRoute(),
          ),
        ],
      )
    ],
  );
}

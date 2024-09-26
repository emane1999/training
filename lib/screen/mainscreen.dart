import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/theme_provider/themeproivders.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Theme Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).setDarkTheme();
              },
              icon: (Icon(Icons.dark_mode)),
            ),
            IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).setLightTheme();
              },
              icon: (Icon(Icons.light_mode)),
            ),
            // ElevatedButton(
            //   onPressed: () {
            // //     ref.read(appThemeProvider.notifier).toggleTheme();
            // //   },
            //   child: const Text('setToggleTheme'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     ref.read(appThemeProvider.notifier).setSystemTheme();
            //   },
            //   child: const Text('setSystemTheme'),
            // ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Switch Toggle Button Example'),
    //   ),
    //   body: Center(
    //     child: IconButton(
    //         onPressed: () {
    // },
    //         icon: Icon(ThemeMode.system == ThemeMode.dark
    //             ? Icons.light_mode
    //             : Icons.dark_mode)),
    //   ),
    // );
  }
}

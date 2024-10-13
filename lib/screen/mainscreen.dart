import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:training/api/api_service.dart';
import 'package:training/api/constant.dart';
import 'package:training/generated/l10n.dart';
import 'package:training/modul/pretty_face.dart';
import 'package:training/theme_provider/applanguagenotifier.dart';
import 'package:training/theme_provider/makeapirequest.dart';
import 'package:training/theme_provider/themeproivders.dart';

class MainScreen extends ConsumerStatefulWidget {
  String id;
  MainScreen({super.key, required this.id});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(appLanguageNotifierProvider);

    final perrty = ref.watch(getApiRequestProvider);

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

            Text(
              S.of(context)!.assalamualaikum,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                ref
                    .read(appLanguageNotifierProvider.notifier)
                    .changeLanguage(Locale('en'));
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'English',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () => ref
                  .read(appLanguageNotifierProvider.notifier)
                  .changeLanguage(Locale('ar')),
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Ar',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),

            AutoSizeText(
              "${perrty.value?.toString()}",
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                ref.refresh(getApiRequestProvider.future);
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Api requst',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            FilledButton(
              onPressed: () {
                context.go('/splash_screen/botton_route');
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Hi ,${widget.id}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
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

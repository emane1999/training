import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:training/screen/botton_route.dart';
import 'package:training/screen/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a time-consuming task (e.g., loading data) for the splash screen.
    // Replace this with your actual data loading logic.
    Future.delayed(
      Duration(seconds: 6),
      () {
        context.go('/splash_screen/mainscreen/:id');
        //  MainScreen(
        //       id: "wecome",
        //     ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
          width: MediaQuery.of(context).size.width * 300,
          height: MediaQuery.of(context).size.width * 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset(
            fit: BoxFit.cover,
            'assets/images/svg (1).svg',
          ),
        ),
      ),
    );
  }
}

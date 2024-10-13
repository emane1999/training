import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training/main.dart';

class BottonRoute extends StatelessWidget {
  const BottonRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              child: Text("hi,"),

              // remember to add "name" to your routes
              onPressed: () {
                String m = "wecome";
                context.go('/splash_screen/mainscreen/$m');
              }),
        ],
      ),
    );
  }
}

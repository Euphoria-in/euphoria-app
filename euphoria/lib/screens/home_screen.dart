import 'package:flutter/material.dart';

// Home Screen
class HomeScreen extends StatelessWidget {
  // home screen route
  static const String homeScreenRoute = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          decoration: const BoxDecoration(
              // color: Color.fromARGB(0, 255, 255, 255),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  // color: Color.fromARGB(139, 14, 242, 86),
                  blurRadius: 10.0,
                  spreadRadius: 10.0,
                ),
              ]),
        ),
      ),
    );
  }
}

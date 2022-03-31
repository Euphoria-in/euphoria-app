import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gloweffect extends StatelessWidget {
  const Gloweffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
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

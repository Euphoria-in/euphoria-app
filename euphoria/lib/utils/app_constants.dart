// constant class
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppConstants {
  // the const below is used to style the social login button container
  static BoxDecoration socialLoginButtonContainerDesign = BoxDecoration(
    color: const Color(0x00EEEEEE),
    borderRadius: BorderRadius.circular(10),
    border: const GradientBoxBorder(
      gradient: LinearGradient(colors: [Color(0xFFFFC179), Color(0x0ffffff1)]),
      width: 1,
    ),
  );

  // the const below is used to style the text on the social login button
  static const TextStyle socialLoginButtonTextStyle = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 14,
  );
}

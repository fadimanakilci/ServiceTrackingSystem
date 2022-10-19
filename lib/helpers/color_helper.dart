
import 'package:flutter/material.dart';

class ColorHelper{
  static const Color background = Color(0xfff5f5f5);
  static const Color primary = Color(0xff009ecb);
  static const Color primaryDark = Color(0xff071f39);
  static const Color secondary = Color(0xff505050);
  static const Color darkGrey = Color(0xff393939);
  static const Color grey = Color(0xff767676);
  static const Color lightGrey = Color(0xffbfbfbf);
  static const Color red = Color(0xfffd0d1b);
  static const Color green = Color(0xff00A36C);

  Gradient blueGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff0E8EF5),
      Color(0xff5fb8ff),
    ],
  );
}
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color colorFb = Color(0xff3B5998);
  static const Color colorTw = Color(0xFF55ACEE);
  static const Color white = Colors.white;
  static const Color main = Color(0xFFF0F2F6);
  static const Color orage = Color(0xffFE9C5E);
  static const Color red = Color(0xFFF77777);
  static const Color emerald = Color(0xFF3EC8BC);
  static const Color grey = Color(0xffD8D8D8);
  static const Color lavender = Color(0xff6357CC);
  static const Color label = Color(0xFF636363);
  static const Color input = Color(0xFF313131);

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 1),
    )
  ];
}

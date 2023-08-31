import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color colorFb = Color(0xff3B5998);
  static const Color colorTw = Color(0xFF55ACEE);
  static const Color colorGpt = Color(0xff78AD9F);
  static const Color white = Colors.white;
  static const Color orage = Color(0xffFE9C5E);
  static const Color red = Color(0xFFF77777);
  static const Color emerald = Color(0xFF3EC8BC);
  static const Color grey = Color(0xffD8D8D8);
  static const Color main = Color(0xff1E2870);
  static const Color label = Color(0xFF636363);
  static const Color input = Color(0xFF313131);
  static const Color star = Color(0xFFFFD23D);

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 1),
    )
  ];
}

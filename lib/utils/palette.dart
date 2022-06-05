import 'package:flutter/material.dart';

class Palette {
  static const Color dark = Color(0xFF222222);
  static const Color white = Color(0xFFFFFFFF);

  static const _bluePrimaryValue = 0xFF006098;
  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE2F6FC),
      100: Color(0xFFB5E8F9),
      200: Color(0xFF86D9F5),
      300: Color(0xFF59CAF1),
      400: Color(0xFF39BEF0),
      500: Color(0XFF1EB3EF),
      600: Color(0xFF16A5E0),
      700: Color(0xFF0B91CD),
      800: Color(0xFF0A80B9),
      900: Color(_bluePrimaryValue),
    },
  );
}
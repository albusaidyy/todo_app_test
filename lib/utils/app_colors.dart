// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor mcolor =
      const MaterialColor(_mcolorPrimaryValue, <int, Color>{
    50: Color(0xFFE7EBF5),
    100: Color(0xFFC2CCE6),
    200: Color(0xFF9AABD5),
    300: Color(0xFF7289C4),
    400: Color(0xFF536FB8),
    500: const Color(_mcolorPrimaryValue),
    600: Color(0xFF304FA4),
    700: Color(0xFF28459A),
    800: Color(0xFF223C91),
    900: Color(0xFF162B80),
  });
  static const int _mcolorPrimaryValue = 0xFF3556AB;

  static MaterialColor mcolorAccent =
      const MaterialColor(_mcolorAccentValue, <int, Color>{
    100: Color(0xFFB7C3FF),
    200: const Color(_mcolorAccentValue),
    400: Color(0xFF516FFF),
    700: Color(0xFF375AFF),
  });

  static const int _mcolorAccentValue = 0xFF8499FF;
  static Color backGroundColor = const Color(0xFFF3F3F3);
  static Color mainBlue = const Color(0xFF071D55);
  static Color textNotDone = const Color(0xFF071D55);
  static Color textDone = const Color(0xFF8D8D8D);
}

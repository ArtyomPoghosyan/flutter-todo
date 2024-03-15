import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData basicTheme() => ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headline2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: DescriptionTextColor,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(pinkColor))));

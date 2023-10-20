import 'package:flutter/material.dart';

class ApplicationTheme {
  static const Color primaryColor = Color(0xff39A552);

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      toolbarHeight: 150,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: Color(0xff303030),
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: Color(0xff303030),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff303030),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: Color(0xff303030),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

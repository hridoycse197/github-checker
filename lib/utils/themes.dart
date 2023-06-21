import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
      displaySmall: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
      displayMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 22),
    ),
    scaffoldBackgroundColor: const Color(0xff447381),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(Get.width * .4, 45)),
        iconColor: MaterialStateProperty.all(
          Colors.black,
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    colorScheme: const ColorScheme.light(
      background: Color(0xff447381),
      primary: Colors.white,
      onBackground: Colors.white,
      onPrimary: Color(0xff447381),
      onSecondary: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      suffixIconColor: Colors.black,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white.withOpacity(.6),
      contentTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black.withOpacity(.9),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black.withOpacity(0.6),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(Get.width * .4, 45)),
        iconColor: MaterialStateProperty.all(
          Colors.black.withOpacity(0.8),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: const Color(0xffFFFFFF),
      onBackground: Colors.white.withOpacity(.8),
      background: Colors.black.withOpacity(0.8),
      onSecondary: Colors.black.withOpacity(0.6),
      onPrimary: Colors.white.withOpacity(.8),
    ),
    textTheme: TextTheme(
      bodySmall: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
      displaySmall: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.normal, fontSize: 15),
      displayMedium: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.normal, fontSize: 18),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      suffixIconColor: Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white.withOpacity(.6),
      contentTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
    ),
  );
}

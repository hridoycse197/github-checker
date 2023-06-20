import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      displaySmall: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
    ),
    scaffoldBackgroundColor: Colors.purple[100],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(
          Colors.black,
        ),
        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[100],
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xffFFFFFF),
      onBackground: Color(0xff000000).withOpacity(.6),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      suffixIconColor: Colors.black,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white.withOpacity(.6),
      contentTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xffFFFFFF).withOpacity(.6),
        ),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 43, 43, 43),
      onBackground: const Color(0xffFFFFFF).withOpacity(.7),
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      suffixIconColor: Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white.withOpacity(.6),
      contentTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
    ),
  );
}

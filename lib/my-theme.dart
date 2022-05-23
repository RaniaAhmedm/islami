import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimaryColor = Color.fromARGB(255, 183, 147, 95);
  static Color darkPrimaryColor = Color.fromARGB(255, 16, 28, 73);
  static Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static Color whitColor = Color.fromARGB(255, 248, 245, 245);
  static Color yellowColor = Color.fromARGB(255, 250, 204, 29);

  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: blackColor),
        centerTitle: true,
        elevation: 0.0,
      ),
      textTheme: TextTheme(
          headline3: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          headline4: TextStyle(
            color: blackColor,
            fontSize: 20,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: whitColor),
        centerTitle: true,
        elevation: 0.0,
      ),
      textTheme: TextTheme(
          headline3: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: whitColor,
          ),
          headline4: TextStyle(
            color: whitColor,
            fontSize: 20,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellowColor, unselectedItemColor: whitColor));
}

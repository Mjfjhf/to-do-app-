import 'package:flutter/material.dart';

class MyTheme{
  static Color primarylight=Color(0xff5D9CEC);
  static Color redcolor=Colors.red;

  static ThemeData lightmode=ThemeData(
     appBarTheme: AppBarTheme(
       centerTitle: false ,
       backgroundColor: primarylight,
     ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Colors.black
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black
      ),
      subtitle2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black
      ),
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black
      )
  );
  static ThemeData darkmode=ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: false ,
      backgroundColor: primarylight,
    ),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black
        ),
        headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white
        ),
        headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white
        ),
        headline4: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white38
        ),
        headline5: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white
        ),
        headline6: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white
        ),
        subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black
        ),
        subtitle2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white
        ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white
    )
  );
}
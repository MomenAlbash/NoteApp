import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData DarkThemeMode() {

  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // أسود للثيم الفاتح
        ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xFF2D2D2D),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF2D2D2D),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF2D2D2D),
      ),
      titleTextStyle: TextStyle(

        fontWeight: FontWeight.bold,
        fontSize: 20,

      ),
    ),
    scaffoldBackgroundColor: const Color(0xFF2D2D2D),
  );
}

ThemeData LigthThemeMode() {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // أسود للثيم الفاتح
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,

          )
      )
  );
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:services/config/constant.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
      centerTitle: false,
      //elevation: 0,
      backgroundColor: kBackgroundColorLightTheme,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: kPrimaryColor),
    ),
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey[600],
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // By default, flutter provide us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorDarkTheme,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      //elevation: 0,
      backgroundColor: kBackgroundColorDarkTheme,
      titleTextStyle: TextStyle(color: kContentColorDarkTheme),
      iconTheme: IconThemeData(color: kPrimaryColor),
    ),
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorDarkTheme,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kContentColorDarkTheme,
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

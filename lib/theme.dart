import 'package:flutter/material.dart';

class MainColor {
  // static Color primaryColor = Color(0xFF00061a);
  static Color primaryColor = Color(0xFF222222);
  // static Color secondaryColor = Color(0xFF001456);
  static Color secondaryColor = Color(0xFF55578c);
  static Color accentColor = Color(0xFF55578c);
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: MainColor.primaryColor,
      colorScheme: ColorScheme.dark());
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.light());
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    fontFamily: 'Comfortaa',
  );
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    fontFamily: 'Comfortaa',
  );
}

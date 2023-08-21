import 'package:flutter/material.dart';

enum ThemeModeType {
  light,
  dark,
}

class ThemeModeNotifier extends ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.light;

  ThemeModeType get themeMode => _themeMode;

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    notifyListeners();
  }
}

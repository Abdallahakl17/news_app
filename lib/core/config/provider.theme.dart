 import 'package:flutter/material.dart';
import 'package:news_app/core/storage/shared_pref_manger.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = SharedPrefsHelper.getCurrentTheme();
  bool get isDark => currentTheme == ThemeMode.dark;
   void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    SharedPrefsHelper.saveCurrentTheme(currentTheme);
    notifyListeners();
  }

  void toggleTheme() {
    changeTheme(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}

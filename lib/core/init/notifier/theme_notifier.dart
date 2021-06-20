import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../../locators.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = locator<AppThemeLight>().themeData;

  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppThemes get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  /// Change your app theme with [currenThemeEnum] value.
  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = locator<AppThemeLight>().themeData;
      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/models/theme_models/themes.dart';

class MyThemeData {

  /// Returns specific [ThemeData] from provided [ThemeKey]
  /// 
  /// See also: [MyThemeData]
  static ThemeData getThemePreference(ThemeKey appTheme) {
    switch (appTheme) {
      case ThemeKey.LIGHT:
        return MyThemeData.lightTheme;
        break;
      case ThemeKey.DARK:
        return MyThemeData.darkTheme;
        break;
      case ThemeKey.CUSTOM:
        return MyThemeData.greenTheme;
        break;
      default:
        return MyThemeData.lightTheme;
    }
  }   

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: Color.fromRGBO(0, 34, 69, 1)
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    backgroundColor: Colors.black
  );

  
  static final greenTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green
  );

}


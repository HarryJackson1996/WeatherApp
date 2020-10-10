import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_models/themes.dart';
import 'package:weather_app/themes/theme_utils.dart';

class ThemeProvider with ChangeNotifier {
  
  static const String _themeBox = 'themeBox';  
  ThemeData _themeData;

  ThemeProvider() {
    _loadTheme();
  }

  static ThemeProvider of(BuildContext context, {listen = false}) {
    return Provider.of<ThemeProvider>(context, listen: listen);
  }

  /// Loads the app theme from cache when [ThemeProvider] is created.
  void _loadTheme() {
    Hive.openBox(_themeBox).then((box) {
      _themeData = MyThemeData.getThemePreference(box.get(_themeBox));
      notifyListeners();
    });
  }

  /// Getter method for retrieving current theme.
  /// 
  /// If the current theme is null, then there is no theme stored in cache.
  /// In this case, the app theme is defaulted to [MyThemeData.lightTheme].
  ThemeData get themeData {
    if(_themeData == null) {
      _themeData = MyThemeData.getThemePreference(ThemeKey.LIGHT);
    }
    return _themeData;
  }

  /// Setter method for updating and storing current theme based on [ThemeKey].
  void setTheme(ThemeKey appTheme) async {
    _themeData = MyThemeData.getThemePreference(appTheme);
    var box = await Hive.openBox(_themeBox);
    box.put(_themeBox, appTheme);
    notifyListeners();
  }
}
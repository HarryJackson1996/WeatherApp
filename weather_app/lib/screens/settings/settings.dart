import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_models/themes.dart';
import 'package:weather_app/providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  int _value;

  @override
  void initState() {
    super.initState();
    getIndexFromTheme();
  }

  void getIndexFromTheme() {
    ThemeKey _themeKey = Hive.box('themeBox').get('themeBox');
    switch (_themeKey) {
      case ThemeKey.LIGHT:
        _value = 0;       
        break;
      case ThemeKey.DARK:
        _value = 1;       
        break;
      case ThemeKey.CUSTOM:
       _value = 2;       
        break;
      default:
        _value = 0;       
        break;
    }
    print(_themeKey);
  }

  String getTextLabel(int index) {
    switch (index) {
      case 0:
        return 'Light Theme';
        break;
      case 1:
        return 'Dark Theme';
        break;
      case 2:
        return 'Custom Theme';
        break;
      default:
        return 'Light Theme';
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(      
        itemCount: 3,
        itemBuilder: (context, index) {
          return RadioListTile(
            value: index,
            groupValue: _value,
            onChanged: (index) {
              setState(() {
                _value = index;
                if(_value == 0) {
                  Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeKey.LIGHT); 
                } else if(_value == 1) {
                  Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeKey.DARK); 
                } else {
                  Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeKey.CUSTOM); 
                }
              });
            },
            title: Text(getTextLabel(index)),
          );
        },
      ),
    );
  }
}
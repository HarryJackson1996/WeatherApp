import 'package:flutter/material.dart';
import 'package:weather_app/consts/routes.dart';
import 'package:weather_app/screens/home/home.dart';
import 'package:weather_app/screens/settings/settings.dart';
import 'package:weather_app/screens/search/search_screen.dart';

class Router {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
        break;
      case searchRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
        break;
    }
  }
}
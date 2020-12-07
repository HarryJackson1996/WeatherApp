import 'package:flutter/material.dart';
import 'package:weather_app/consts/routes.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/widgets/screen_template.dart';
import 'package:weather_app/screens/weather/weather_home.dart';

class HomeScreen extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: ThemeProvider.of(context).themeData.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, searchRoute);
            },
          ),
          actions: [ 
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, settingsRoute);
              },
            )
          ],
        ),
        backgroundColor: ThemeProvider.of(context).themeData.backgroundColor,
        body: ScreenTemplate(
          WeatherHome(),
          topPadding: true,
        ),
      ),
    );
  }
}


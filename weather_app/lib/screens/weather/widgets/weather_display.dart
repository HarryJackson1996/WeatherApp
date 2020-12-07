import 'package:flutter/material.dart';
import 'package:weather_app/models/data_models/weather.dart';

class WeatherDisplay extends StatelessWidget {

  final Weather weather;

  WeatherDisplay(
    this.weather,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Text(
              weather.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
         Container(
          child: Center(
            child: Text(
              weather.main.temp.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
          Container(
          child: Center(
            child: Text(
              weather.weather[0].description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
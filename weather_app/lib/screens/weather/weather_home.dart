import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/clients/weather_client.dart';
import 'package:weather_app/models/data_models/weather.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/services/location_services.dart';
import 'package:weather_app/screens/weather/widgets/weather_display.dart';

class WeatherHome extends StatelessWidget {

  final WeatherRepository weatherRepository = WeatherRepository(
    locationServices: LocationServices(),
    weatherClient: WeatherClient(Dio()),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: weatherRepository.fetchWeather("surbiton"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.data != null && snapshot.hasData) {
          return WeatherDisplay(snapshot.data);
        } else {
        return Center(child: CircularProgressIndicator());
        }
      },      
    );
  }
}
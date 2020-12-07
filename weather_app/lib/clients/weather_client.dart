import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/models/data_models/weather.dart';

class WeatherClient {

  final String _apiKey = "247f9e0d951d640a8515aa3995884175";
  final Dio _dio;

  WeatherClient(this._dio);
  
  Future<Weather> fetchWeatherFromCity(String cityName) async {
    final String url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey&units=metric";
    try {
      final response = await _dio.get(url);
      var weather = Weather.fromJson(response.data);
      return weather;
    } on DioError catch(e) {
      throw WeatherException.fromDioError(e);
    }
  }

} 

class WeatherException implements Exception {
  String errorMessage;
  WeatherException.fromDioError(DioError dioError) {
    switch(dioError.type) {
      case DioErrorType.CANCEL:
      errorMessage = "Request was cancelled";
      break;
      case DioErrorType.CONNECT_TIMEOUT:
      errorMessage = "Connection timeout";
      break;
      case DioErrorType.DEFAULT:
      errorMessage = "Connection to server failed due to internet connection";
      break;
      case DioErrorType.RECEIVE_TIMEOUT:
      errorMessage = "Recieved timeout in connection with API server";
      break;
      case DioErrorType.RESPONSE:
      errorMessage = "Error recieved status code: ${dioError.response.statusMessage}";
      break;
      case DioErrorType.SEND_TIMEOUT:
      errorMessage = "Request was cancelled";
      break;     
     default:
      errorMessage = "Something went wrong";
      break;
    }
  }
}
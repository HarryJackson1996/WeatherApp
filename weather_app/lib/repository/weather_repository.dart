import 'package:geolocator/geolocator.dart';
import 'package:weather_app/clients/weather_client.dart';
import 'package:weather_app/models/data_models/weather.dart';
import 'package:weather_app/services/location_services.dart';


class WeatherRepository {

  final LocationServices locationServices;
  final WeatherClient weatherClient;

  WeatherRepository({
    this.locationServices,
    this.weatherClient,
  }); 

  Future<Weather> fetchWeather(String city) async {
    switch (await locationServices.checkPermissions()) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        return await weatherClient.fetchWeatherFromCity(city);
        break;
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return await weatherClient.fetchWeatherFromCity(city);
        break;
      default:
        return await weatherClient.fetchWeatherFromCity(city);
        break;
    }
  }

}
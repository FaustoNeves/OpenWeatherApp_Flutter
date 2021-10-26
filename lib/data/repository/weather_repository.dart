import 'package:weather_app_flutter/data/models/weather/weather.dart';
import 'package:weather_app_flutter/data/remote/weather_api.dart';

class WeatherRepository {
  final WeatherAPI weatherAPI;

  WeatherRepository({required this.weatherAPI});

  Future<Weather> getWeather(
      String? cityName, String? lat, String? lon) async {
    final weatherResponse = await weatherAPI.getWeather(cityName, lat, lon);
    return Weather.fromJson(weatherResponse);
  }
}

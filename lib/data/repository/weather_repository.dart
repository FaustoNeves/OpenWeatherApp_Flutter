
import 'package:weather_app_flutter/data/remote/weather/weather_api.dart';

class WeatherRepository {
  final WeatherAPI weatherAPI;

  WeatherRepository({required this.weatherAPI});

  Future getWeather(String? cityName, Map<String, double>? coordinates) async {
    return await weatherAPI.getWeather(cityName, coordinates?['lat'], coordinates?['lon']);
  }
}

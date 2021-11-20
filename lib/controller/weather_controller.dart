import 'package:weather_app_flutter/data/repository/weather_repository.dart';

class WeatherController {
  Future fetchWeather(
      String? cityName, Map<String, double>? coordinates) async {
    WeatherRepository weatherRepository = WeatherRepository();

    return await weatherRepository.fetchWeather(cityName, coordinates);
  }
}

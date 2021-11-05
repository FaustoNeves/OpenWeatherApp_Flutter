import 'package:weather_app_flutter/data/remote/weather_api.dart';
import 'package:weather_app_flutter/data/repository/weather_repository.dart';

class WeatherService {
  Future getWeather(String? cityName, Map<String, double>? coordinates) async {
    WeatherRepository weatherRepository =
        WeatherRepository(weatherAPI: WeatherAPI());

    if (cityName == null) {
      return await weatherRepository.getWeather(cityName, coordinates);
    } else {
      return await weatherRepository.getWeather(cityName, null);
    }
  }
}

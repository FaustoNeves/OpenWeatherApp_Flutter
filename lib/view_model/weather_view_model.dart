import 'package:weather_app_flutter/data/repository/location_repository.dart';
import 'package:weather_app_flutter/data/repository/weather_repository.dart';

class WeatherViewModel {
  WeatherRepository _weatherRepository = WeatherRepository();
  LocationRepository _locationRepository = LocationRepository();

  Future fetchWeather(String? cityName) async {
    Map<String, double> coordinates =
        await _locationRepository.getCoordinates() as Map<String, double>;

    return await _weatherRepository.fetchWeather(cityName, coordinates);
  }
}

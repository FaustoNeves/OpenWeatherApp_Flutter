import 'package:weather_app_flutter/controller/location_controller.dart';
import 'package:weather_app_flutter/controller/weather_controller.dart';

class WeatherViewModel {
  WeatherController _weatherController = WeatherController();
  LocationController _locationController = LocationController();

  Future fetchWeather(String? cityName) async {
    Map<String, double> coordinates =
        await _locationController.getCoordinates() as Map<String, double>;

    return await _weatherController.fetchWeather(cityName, coordinates);
  }
}

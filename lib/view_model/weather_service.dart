import 'package:weather_app_flutter/controller/location_controller.dart';
import 'package:weather_app_flutter/controller/weather_controller.dart';

class WeatherService {
  WeatherController _weatherController = WeatherController();
  LocationController _locationController = LocationController();

  Future getWeather(String? cityName) async {
    Map<String, double> coordinates =
        await _locationController.getCoordinates() as Map<String, double>;

    return await _weatherController.getWeather(cityName, coordinates);
  }

  Future getPermissions() async {
    return await _locationController.getCoordinates() as Map<String, double>;
  }
}

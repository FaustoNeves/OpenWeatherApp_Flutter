import 'package:weather_app_flutter/service/location_service.dart';
import 'package:weather_app_flutter/service/weather_service.dart';

class GetWeatherUseCase {
  WeatherService weatherService = WeatherService();
  LocationService locationService = LocationService();

  Future getWeatherUseCase(String? cityName) async {
    Map<String, double> coordinates =
        await locationService.getCoordinates() as Map<String, double>;

    return await weatherService.getWeather(cityName, coordinates);
  }

  Future getPermissions() async {
    return await locationService.getCoordinates() as Map<String, double>;
  }
}

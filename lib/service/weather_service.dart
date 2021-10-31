import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/data/models/location/location.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';
import 'package:weather_app_flutter/data/remote/weather_api.dart';
import 'package:weather_app_flutter/data/repository/location_repository.dart';
import 'package:weather_app_flutter/data/repository/weather_repository.dart';

class WeatherService {
  Future<Weather> getWeather(String? cityName) async {
    WeatherRepository weatherRepository =
        WeatherRepository(weatherAPI: WeatherAPI());

    LocationRepository locationRepository = LocationRepository();

    if (cityName == null) {
      Location location = await locationRepository.getLocation();
      if (!location.serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
      if (location.permissionAvailability == LocationPermission.denied ||
          location.requestPermission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      } else {
        if (location.permissionAvailability ==
                LocationPermission.deniedForever ||
            location.requestPermission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
      }
      return await weatherRepository.getWeather(
          cityName, location.lat, location.lon);
    } else {
      return await weatherRepository.getWeather(cityName, null, null);
    }
  }
}


import 'package:weather_app_flutter/data/remote/base_http/api_base_helper.dart';

class WeatherRepository {
  String apiId = "YOUR_API_KEY";
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/";
  final ApiBaseHelper apiBaseHelper = ApiBaseHelper(baseUrl);
  late String url;

  Future fetchWeather(
      String? cityName, Map<String, double>? coordinates) async {
    double? lat = coordinates?['lat'];
    double? lon = coordinates?['lon'];
    cityName == null
        ? url = "weather?lat=$lat&lon=$lon&appid=$apiId"
        : url = "weather?q=$cityName&appid=$apiId";

    return await apiBaseHelper.fetchWeather(url);
  }
}

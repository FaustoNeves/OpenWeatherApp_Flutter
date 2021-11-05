import 'dart:convert';

import 'package:http/http.dart' show Response, get;
import 'package:weather_app_flutter/data/models/weather/weather.dart';

class WeatherAPI {
  String apiId = "0cffb35ecd63d1162d3e70dd625132fc";
  late String url;

  Future getWeather(
      String? location, double? lat, double? lon) async {
      if (location == null) {
        url =
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiId";
      } else {
        url =
            "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiId";
      }
      Response response = await get(url);
      return jsonDecode(response.body);
  }
}

import 'dart:convert';

import 'package:http/http.dart' show Response, get;

class WeatherAPI {
  String appiId = "0cffb35ecd63d1162d3e70dd625132fc";
  late String url;

  Future<dynamic>? getWeather(
      String? location, String? lat, String? lon) async {
    try {
      if (location == null) {
        url =
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appiId";
      } else {
        url =
            "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$appiId";
      }
      Response response = await get(url);
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return [];
    }
  }
}

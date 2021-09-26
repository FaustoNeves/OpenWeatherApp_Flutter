import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  String location;

  Weather({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String windSpeed;
  late String description;
  late String main;

  Future<void> getData() async {
    try {
      Response response = await get(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0cffb35ecd63d1162d3e70dd625132fc");
      Map data = jsonDecode(response.body);

      Map tempData = data['main'];

      int getHumidity = tempData['humidity'];
      double getTemp = tempData['temp'] -273.15;

      Map wind = data['wind'];
      double getWindSpeed = wind['speed'];

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMain = weatherMainData['main'];
      String getDescription = weatherMainData["description"];

      temp = getTemp.toString();
      humidity = getHumidity.toString();
      windSpeed = getWindSpeed.toString();
      description = getDescription.toString();
      main = getMain.toString();
    } catch (error) {
      temp = "Error";
      humidity = "Error";
      windSpeed = "Error";
      description = "Error";
      main = "Error";
    }
  }
}

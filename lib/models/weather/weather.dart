import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  final appiId = "0cffb35ecd63d1162d3e70dd625132fc";
  String? location;

  Weather({this.location}) {
    this.location = location;
  }

  late String temp;
  late String tempMin;
  late String tempMax;
  late String humidity;
  late String windSpeed;
  late String description;
  late String main;
  late String city;
  late String country;

  Future<void> getData() async {
    late Map data;
    try {
      Response response = await get(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$appiId");
      data = jsonDecode(response.body);

      Map tempData = data['main'];

      double getTemp = tempData['temp'] - 273.15;
      double getMaxTemp = tempData['temp_max'] - 273.15;
      double getMinTemp = tempData['temp_min'] - 273.15;
      int getHumidity = tempData['humidity'];

      Map wind = data['wind'];
      double getWindSpeed = wind['speed'];

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMain = weatherMainData['main'];
      String getDescription = weatherMainData["description"];

      Map sysData = data['sys'];
      String countryData = sysData['country'];

      temp = getTemp.toString();
      tempMax = getMaxTemp.toString();
      tempMin = getMinTemp.toString();
      humidity = getHumidity.toString();
      windSpeed = getWindSpeed.toString();
      description = getDescription.toString();
      main = getMain.toString();
      country = countryData;
      city = location!;
    } catch (error) {
      print(error.toString());
      temp = "Error";
      humidity = "Error";
      windSpeed = "Error";
      description = "Error";
      main = "Error";
      city = "";
      country = "";
    }
  }
}

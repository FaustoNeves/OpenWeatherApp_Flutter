import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  final appiId = "0cffb35ecd63d1162d3e70dd625132fc";
  String? location;
  String? lat;
  String? lon;

  Weather({this.location, this.lat, this.lon}) {
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
  late String url;
  late String icon;

  Weather.fromJson(Map json) {
    Map mainData = json['main'];
    temp = mainData['temp'] - 273.15;
    tempMax = mainData['temp_max'] - 273.15;
    tempMin = mainData['temp_min'] - 273.15;

    Map weatherMainData = mainData[0];
    description = weatherMainData['description'];
    main = weatherMainData['main'];
    city = mainData['name'];

    Map sysData = mainData['sys'];
    country = sysData['country'];
    icon = weatherMainData['icon'];
  }

  Future<void> getData() async {
    try {
      if (location == null) {
        url =
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appiId";
      } else {
        url =
            "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$appiId";
      }
      Response response = await get(url);
      Map data = jsonDecode(response.body);

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
      String getIcon = weatherMainData['icon'];

      Map sysData = data['sys'];
      String countryData = sysData['country'];
      String cityName = data['name'];
      temp = getTemp.toString();
      tempMax = getMaxTemp.toString();
      tempMin = getMinTemp.toString();
      humidity = getHumidity.toString();
      windSpeed = getWindSpeed.toString();
      description = getDescription.toString();
      main = getMain.toString();
      country = countryData;
      city = cityName;
      icon = getIcon;
    } catch (error) {
      temp = "Error";
      tempMax = "Error";
      tempMin = "Error";
      humidity = "Error";
      windSpeed = "Error";
      description = "Error";
      main = "Error";
      city = "";
      country = "";
    }
  }
}

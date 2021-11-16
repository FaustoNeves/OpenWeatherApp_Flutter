import 'package:flutter/material.dart';

class Weather {
  late String temp;
  late String tempMin;
  late String tempMax;
  late String description;
  late String main;
  late String city;
  late String country;
  late String url;
  late String icon;
  late Color mainColor;
  late Color backgroundColor;
  late String weatherImage;

  Weather();

  Weather.fromMap(Map map) {
    Map mainData = map['main'];
    temp = ((mainData['temp'] - 273.15).toString().substring(0, 2))
        .replaceAll("", "");
    tempMax = ((mainData['temp_max'] - 273.15).toString().substring(0, 2))
        .replaceAll("", "");
    tempMin = ((mainData['temp_min'] - 273.15).toString().substring(0, 2))
        .replaceAll("", "");

    List weatherMainDataList = map['weather'];
    Map weatherMainData = weatherMainDataList[0];
    description = weatherMainData['description'];
    main = weatherMainData['main'];
    city = map['name'];

    Map sysData = map['sys'];
    country = sysData['country'];
    icon = weatherMainData['icon'];

    switch (icon) {
      case '01d':
        {
          mainColor = Colors.black;
          weatherImage = "assets/clear_sky_day.png";
          backgroundColor = Colors.orange[600]!;
        }
        break;

      case '01n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/clear_sky_night.png";
          backgroundColor = Colors.deepPurple;
        }
        break;
      case '02d':
        {
          mainColor = Colors.black;
          weatherImage = "assets/clouds_day.png";
          backgroundColor = Colors.orange[600]!;
        }
        break;

      case '02n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/clouds_night.png";
          backgroundColor = Colors.deepPurple;
        }
        break;
      case '03d':
        {
          mainColor = Colors.black;
          weatherImage = "assets/clouds_day_2.png";
          backgroundColor = Colors.orange[600]!;
        }
        break;

      case '03n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/clouds_night_2.png";
          backgroundColor = Colors.deepPurple;
        }
        break;
      case '04d':
        {
          mainColor = Colors.black;
          weatherImage = "assets/clouds_day_2.png";
          backgroundColor = Colors.orange[600]!;
        }
        break;

      case '04n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/clouds_night_2.png";
          backgroundColor = Colors.deepPurple;
        }
        break;

      case '09d':
        {
          mainColor = Colors.white;
          weatherImage = "assets/rain.png";
          backgroundColor = Colors.grey[700]!;
        }
        break;

      case '09n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/rain.png";
          backgroundColor = Colors.blueGrey[900]!;
        }
        break;
      case '10d':
        {
          mainColor = Colors.white;
          weatherImage = "assets/rain.png";
          backgroundColor = Colors.grey[700]!;
        }
        break;

      case '10n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/rain.png";
          backgroundColor = Colors.blueGrey[900]!;
        }
        break;

      case '11d':
        {
          mainColor = Colors.white;
          weatherImage = "assets/heavy_rain.png";
          backgroundColor = Colors.grey[800]!;
        }
        break;
      case '11n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/heavy_rain.png";
          backgroundColor = Colors.blueGrey[900]!;
        }
        break;
      case '13d':
        {
          mainColor = Colors.black;
          weatherImage = "assets/snow.png";
          backgroundColor = Colors.white;
        }
        break;
      case '13d':
        {
          mainColor = Colors.white;
          weatherImage = "assets/snow.png";
          backgroundColor = Colors.blueGrey[900]!;
        }
        break;
      case '50d':
        {
          mainColor = Colors.black;
          weatherImage = "assets/fog.png";
          backgroundColor = Colors.grey;
        }
        break;
      case '50n':
        {
          mainColor = Colors.white;
          weatherImage = "assets/fog.png";
          backgroundColor = Colors.grey[700]!;
        }
        break;
    }
  }

  void setProviderContent(Weather weather) {
    this.temp = weather.temp;
    this.tempMin = weather.tempMin;
    this.tempMax = weather.tempMax;
    this.description = weather.description;
    this.main = weather.main;
    this.city = weather.city;
    this.country = weather.country;
    this.icon = weather.icon;
    this.mainColor = weather.mainColor;
    this.backgroundColor = weather.backgroundColor;
    this.weatherImage = weather.weatherImage;
  }
}

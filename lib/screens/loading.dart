import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';
import 'package:weather_app_flutter/service/weather_service.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

const spinKit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

class _LoadingState extends State<Loading> {
  String? city;
  String? lat;
  String? lon;

  void initializeWeatherContent(String? cityName) async {
    Weather weather = await WeatherService().getWeather(cityName);

    Navigator.pushReplacementNamed(context, "/home",
        arguments: weather.weatherMap());
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    initializeWeatherContent(city);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Weather",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "NOW",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue),
                  ),
                  Image.asset(
                    "assets/moonset_night_logo.png",
                    color: Colors.blue,
                  ),
                  SpinKitPouringHourglass(
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
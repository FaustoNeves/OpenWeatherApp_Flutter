import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_flutter/models/weather/weather.dart';

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
  String? city = "Kansas";
  late String temp;
  late String tempMax;
  late String tempMin;
  late String humidity;
  late String windSpeed;
  late String description;
  late String main;
  late String country;

  void initializeApp(String? cityName) async {
    Weather weather = Weather(location: city);
    await weather.getData();
    temp = weather.temp;
    tempMax = weather.tempMax;
    tempMin = weather.tempMin;
    humidity = weather.humidity;
    windSpeed = weather.windSpeed;
    description = weather.description;
    main = weather.main;
    country = weather.country;

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temperature": temp,
      "temperature_max": tempMax,
      "temperature_min": tempMin,
      "humidity": humidity,
      "windSpeed": windSpeed,
      "description": description,
      "main": main,
      "city": city,
      "country": country,
    });
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    initializeApp(city);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app_flutter/models/weather.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String temperature = "Loading...";
  
  late String temp;
  late String humidity;
  late String windSpeed;
  late String description;
  late String main;

  void initView() async {
    Weather weather = Weather(location: "kansas");
    await weather.getData();

    temp = weather.temp;
    humidity = weather.humidity;
    windSpeed = weather.windSpeed;
    description = weather.description;
    main = weather.main;

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temperature": temp,
      "humidity": humidity,
      "windSpeed": windSpeed,
      "description": description,
      "main": main,
    });

    print(description);

    // setState(() {
    //   temperature = weather.temp;
    // });
  }

  @override
  void initState() {
    // initView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Loading..."),
      ),
    );
  }
}

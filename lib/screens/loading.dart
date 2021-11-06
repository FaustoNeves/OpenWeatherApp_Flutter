
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';
import 'package:weather_app_flutter/data/use_case/get_weather_use_case.dart';
import 'package:weather_app_flutter/screens/home.dart';
import 'package:weather_app_flutter/screens/user_orientation.dart';
import 'package:weather_app_flutter/service/weather_service.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? city;
  final weatherService = WeatherService();
  final getWeatherUseCase = GetWeatherUseCase();

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: FutureBuilder(
                future: getWeatherUseCase.getWeatherUseCase(city),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return UserOrientation(errorType: snapshot.error.runtimeType);
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    try {
                      Map weather = snapshot.data as Map;
                      Weather weatherData = Weather.fromMap(weather);
                      return Home(data: weatherData);
                    } catch (exception) {
                      return UserOrientation(
                          errorType: NoResultFoundException);
                    }
                  }
                  return Column(
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
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/moonset_night_logo.png",
                            color: Colors.blue,
                          ),
                          Image.asset("assets/intro_moon.png"),
                          SpinKitRing(
                            color: Colors.orange,
                          ),
                        ],
                      )
                    ],
                  );
                })));
  }
}

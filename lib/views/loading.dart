import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
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
  String? city;
  late String temp;
  late String tempMax;
  late String tempMin;
  late String humidity;
  late String windSpeed;
  late String description;
  late String main;
  late String country;
  late String icon;
  String? lat;
  String? lon;

  void initializeWeatherContent(String? cityName) async {
    if (cityName == null) {
      Position position = await _determinePosition();
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lat = position.latitude.toString();
      lon = position.longitude.toString();
      // List<Placemark> placemarks =
      //     await placemarkFromCoordinates(position.latitude, position.longitude);
      // Placemark place = placemarks[0];
      // cityName = place.name;
      // print("$place");
    }

    Weather weather = Weather(location: cityName, lat: lat, lon: lon);
    await weather.getData();
    //if cityName is empty, then invoke async method to get city name using geolocation
    temp = weather.temp;
    tempMax = weather.tempMax;
    tempMin = weather.tempMin;
    humidity = weather.humidity;
    windSpeed = weather.windSpeed;
    description = weather.description;
    main = weather.main;
    city = weather.city;
    country = weather.country;
    icon = weather.icon;

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
      "icon": icon,
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
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
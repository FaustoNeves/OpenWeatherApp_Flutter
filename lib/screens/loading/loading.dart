import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';
import 'package:weather_app_flutter/screens/user_orientation/user_orientation.dart';
import 'package:weather_app_flutter/screens/weather_info/weather_info.dart';
import 'package:weather_app_flutter/view_model/weather_view_model.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? city;
  final _weatherViewModel = WeatherViewModel();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Weather>(context);
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple[300]!, Colors.orange[500]!],
        ),
      ),
      child: FutureBuilder(
          future: _weatherViewModel.fetchWeather(city),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.runtimeType);
              return UserOrientation(errorType: snapshot.error.runtimeType);
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              try {
                Map weather = snapshot.data as Map;
                provider.setProviderContent(Weather.fromMap(weather));
                return WeatherInfo();
              } catch (exception) {
                return UserOrientation(errorType: NoResultFoundException);
              }
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Weather",
                        style: GoogleFonts.miriamLibre(
                          textStyle: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/weathercock.png",
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "NOW",
                            style: GoogleFonts.jacquesFrancoisShadow(
                              textStyle:
                                  TextStyle(fontSize: 70, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SpinKitRing(
                    color: Colors.grey[800]!,
                  ),
                ),
              ],
            );
          }),
    ));
  }
}

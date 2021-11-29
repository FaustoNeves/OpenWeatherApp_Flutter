import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/cubit/weather_cubit.dart';
import 'package:weather_app_flutter/screens/user_orientation/user_orientation.dart';
import 'package:weather_app_flutter/screens/weather_info/weather_info.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    /**User's input text*/
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      cityName = search!['searchText'];
    }
    BlocProvider.of<WeatherCubit>(context).fetchWeather(cityName);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple[300]!, Colors.orange[500]!],
        ),
      ),
      child: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        print(state.runtimeType.toString());
        if (state is WeatherError)
          /** Goes to user's orientation screen sending any upcoming error*/
          return UserOrientation(errorType: state.runtimeType);
        if (state is WeatherAvailable)
          return WeatherInfo(weather: state.weather);
        return Column(
          /**Waiting request UI*/
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

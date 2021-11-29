import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubit/weather_cubit.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';
import 'package:weather_app_flutter/service/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherService _weatherService = WeatherService();
    return BlocProvider(
      create: (_) => WeatherCubit(_weatherService),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        routes: {
          "/": (context) => Loading(),
          "/loading": (context) => Loading(),
        },
        // onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

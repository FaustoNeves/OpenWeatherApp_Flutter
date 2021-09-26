import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/router/router.dart';
import 'package:weather_app_flutter/views/home.dart';
import 'package:weather_app_flutter/views/loading.dart';
import 'package:weather_app_flutter/views/location.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => Location(),
      },
      // onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

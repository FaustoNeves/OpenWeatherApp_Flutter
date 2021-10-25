import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/router/router.dart';
import 'package:weather_app_flutter/views/home.dart';
import 'package:weather_app_flutter/views/loading.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
      },
      // onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

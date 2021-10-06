import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/views/home.dart';
import 'package:weather_app_flutter/views/loading.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Loading());
      case "/home":
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}

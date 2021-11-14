import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';

void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        "/": (context) => Loading(),
        "/loading": (context) => Loading(),
      },
      // onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

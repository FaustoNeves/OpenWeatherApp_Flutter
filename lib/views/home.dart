import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    print("init state");
  }

  void setState(fn) {
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("activity destroyed");
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () => setState(() {}),
            ),
            Text(info["description"]),
          ],
        ),
      ),
    );
  }
}

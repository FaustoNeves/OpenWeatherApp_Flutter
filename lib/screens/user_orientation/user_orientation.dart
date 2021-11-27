import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/data/remote/base_http/http_exceptions.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';

class UserOrientation extends StatefulWidget {
  final Type errorType;

  const UserOrientation({Key? key, required this.errorType}) : super(key: key);

  @override
  _UserOrientationState createState() => _UserOrientationState();
}

class _UserOrientationState extends State<UserOrientation> {
  final _formKey = GlobalKey<FormState>();
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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
                        textStyle: TextStyle(fontSize: 70, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
            if (widget.errorType == HttpException)
              Flexible(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/repair.png",
                      color: Colors.black,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Internal server error',
                      style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 18)),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      child: Text("Try again"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Loading()));
                      },
                    ),
                  ],
                ),
              ),
            if (widget.errorType == NoResultsException)
              Column(
                children: [
                  Image.asset(
                    "assets/weather_not_found.png",
                    color: Colors.black,
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text(
                        "No places found!",
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        child: Text("Try again"),
                        onPressed: () {
                          _showDialog();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            if (widget.errorType == FetchDataException)
              Column(
                children: [
                  Image.asset(
                    "assets/get_wifi.png",
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Text(
                        "This app requires ethernet connection",
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Click on the button bellow to manually connect to a wifi network",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.black)),
                        icon: Icon(Icons.wifi),
                        label: Text(
                          "WiFi",
                          style: GoogleFonts.roboto(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          AppSettings.openWIFISettings();
                        },
                      ),
                      ElevatedButton(
                        child: Text("Try again"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loading()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            if (widget.errorType == PermissionDeniedException)
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/get_location.png",
                      color: Colors.black,
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Text(
                          "This app requires controller location",
                          style: GoogleFonts.roboto(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Click on the button bellow to manually enable your location controller",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.black)),
                          icon: Icon(Icons.place),
                          label: Text(
                            "Location",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            GeolocatorPlatform.instance.openAppSettings();
                          },
                        ),
                        ElevatedButton(
                          child: Text("Try again"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loading()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            // PermissionsDeniedWidget(),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Flexible(
          child: AlertDialog(
            title: Text("Weather search"),
            content: Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                    labelText: "City name",
                    labelStyle: TextStyle(
                      color: Colors.black87,
                    )),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'This field cannot be empty';
                  }
                },
                onSaved: (text) {
                  cityName = text;
                },
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("Search"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, "/loading", arguments: {
                      "searchText": cityName,
                    });
                  }
                },
              ),
              ElevatedButton(
                child: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

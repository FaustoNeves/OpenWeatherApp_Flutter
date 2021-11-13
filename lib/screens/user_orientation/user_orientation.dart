import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';

class UserOrientation extends StatefulWidget {
  final Type errorType;

  const UserOrientation({Key? key, required this.errorType}) : super(key: key);

  @override
  _UserOrientationState createState() => _UserOrientationState();
}

class _UserOrientationState extends State<UserOrientation> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
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
                ],
              ),
              if (widget.errorType == HttpException)
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/repair.png",
                        color: Colors.blue,
                      ),
                      Column(
                        children: [
                          Text(
                            'Internal server error',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
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
              // InternalServerErrorWidget(),
              if (widget.errorType == NoResultFoundException)
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/weather_not_found.png",
                        color: Colors.blue,
                      ),
                      Column(
                        children: [
                          Text(
                            "No places found!",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
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
                ),
              // NoResultsFoundWidget(),
              if (widget.errorType == SocketException)
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/get_wifi.png",
                        color: Colors.blue,
                      ),
                      Column(
                        children: [
                          Text(
                            "This app requires ethernet connection",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Click on the button bellow to manually connect to a wifi network",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.blue)),
                            icon: Icon(Icons.wifi),
                            label: Text("WIFI"),
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
                ),
              // NoEthernetAcessWidget(),
              if (widget.errorType == PermissionDeniedException)
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/get_location.png",
                        color: Colors.blue,
                      ),
                      Column(
                        children: [
                          Text(
                            "This app requires service location",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Click on the button bellow to manually enable your location service",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.blue)),
                            icon: Icon(Icons.place),
                            label: Text("Location"),
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
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Weather search"),
          content: TextField(
            controller: searchController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "City name",
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Search"),
              onPressed: () {
                Navigator.pushNamed(context, "/loading", arguments: {
                  "searchText": searchController.text,
                });
              },
            ),
            ElevatedButton(
              child: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

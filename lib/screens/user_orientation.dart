import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/screens/loading.dart';

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
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
                Image.asset(
                  "assets/moonset_night_logo.png",
                  color: Colors.blue,
                ),
                if (widget.errorType == PermissionDeniedException)
                  Column(
                    children: [
                      Text(
                        "This app requires service location",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),Text(
                        "Click on the button bellow to manually enable your location service",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue)),
                        icon: Icon(Icons.place),
                        label: Text("Location"),
                        onPressed: () {
                          GeolocatorPlatform.instance.openAppSettings();
                        },
                      ),
                    ],
                  ),
                if (widget.errorType == SocketException)
                  Column(
                    children: [
                      Text(
                        "This app requires ethernet connection",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),Text(
                        "Click on the button bellow to manually connect to a wifi network",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue)),
                        icon: Icon(Icons.wifi),
                        label: Text("WIFI"),
                        onPressed: () {
                          AppSettings.openWIFISettings();
                        },
                      ),
                    ],
                  ),
                if(widget.errorType == NoResultFoundException)
                  Text("No places found!", style: TextStyle(color: Colors.white, fontSize: 18),),
                if (widget.errorType == HttpException)
                  Text('Internal server error'),
                ElevatedButton(
                  child: Text("Try again"),
                  onPressed: () {
                    if(widget.errorType != NoResultFoundException)
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loading()));
                    else
                      _showDialog();
                  },
                ),
              ],
            ),
          ],
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

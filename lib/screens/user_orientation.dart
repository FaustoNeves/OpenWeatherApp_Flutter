import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/screens/loading.dart';

class UserOrientation extends StatefulWidget {
  final Type errorType;

  const UserOrientation({Key? key, required this.errorType}) : super(key: key);

  @override
  _UserOrientationState createState() => _UserOrientationState();
}

class _UserOrientationState extends State<UserOrientation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Iam ready"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loading()));
              },
            ),
            if (widget.errorType == PermissionDeniedException)
              Column(
                children: [
                  Text(
                    "Turn on your location settings",
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    child: Icon(Icons.place),
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
                    "Turn on your ethernet connection",
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    child: Icon(Icons.wifi),
                    onPressed: () {
                      AppSettings.openWIFISettings();
                    },
                  ),
                ],
              ),
            if (widget.errorType == HttpException)
              Text('Internal server error'),
          ],
        ),
      ),
    );
  }
}

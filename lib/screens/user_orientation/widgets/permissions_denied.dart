import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';

class PermissionsDeniedWidget extends StatefulWidget {
  const PermissionsDeniedWidget({Key? key}) : super(key: key);

  @override
  _PermissionsDeniedWidgetState createState() => _PermissionsDeniedWidgetState();
}

class _PermissionsDeniedWidgetState extends State<PermissionsDeniedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/get_location.png",
            color: Colors.blue,
          ),
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
          SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
            style:
                OutlinedButton.styleFrom(side: BorderSide(color: Colors.blue)),
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
                  context, MaterialPageRoute(builder: (context) => Loading()));
            },
          ),
        ],
      ),
    );
  }
}

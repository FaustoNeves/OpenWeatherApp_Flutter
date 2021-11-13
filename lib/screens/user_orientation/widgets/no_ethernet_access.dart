import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';

class NoEthernetAcessWidget extends StatefulWidget {
  const NoEthernetAcessWidget({Key? key}) : super(key: key);

  @override
  _NoEthernetAcessWidgetState createState() => _NoEthernetAcessWidgetState();
}

class _NoEthernetAcessWidgetState extends State<NoEthernetAcessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/get_wifi.png",
            color: Colors.blue,
          ),
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
          OutlinedButton.icon(
            style:
                OutlinedButton.styleFrom(side: BorderSide(color: Colors.blue)),
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
                  context, MaterialPageRoute(builder: (context) => Loading()));
            },
          ),
        ],
      ),
    );
  }
}

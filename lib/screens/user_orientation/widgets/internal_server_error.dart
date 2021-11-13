import 'package:flutter/material.dart';
import 'package:weather_app_flutter/screens/loading/loading.dart';

class InternalServerErrorWidget extends StatefulWidget {
  const InternalServerErrorWidget({Key? key}) : super(key: key);

  @override
  _InternalServerErrorWidgetState createState() =>
      _InternalServerErrorWidgetState();
}

class _InternalServerErrorWidgetState extends State<InternalServerErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/repair.png",
            color: Colors.blue,
          ),
          Text(
            'Internal server error',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
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

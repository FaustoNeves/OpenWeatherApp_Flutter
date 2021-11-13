import 'package:flutter/material.dart';

class NoResultsFoundWidget extends StatefulWidget {
  const NoResultsFoundWidget({Key? key}) : super(key: key);

  @override
  _NoResultsFoundWidgetState createState() => _NoResultsFoundWidgetState();
}

class _NoResultsFoundWidgetState extends State<NoResultsFoundWidget> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/weather_not_found.png",
            color: Colors.blue,
          ),
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

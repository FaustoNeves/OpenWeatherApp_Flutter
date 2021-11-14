
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';

class WeatherInfo extends StatefulWidget {
  final Weather? data;

  const WeatherInfo({Key? key, this.data}) : super(key: key);

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  TextEditingController searchController = new TextEditingController();
  late String backgroundImage;
  late Color mainColor;
  late Color backgroundColor;
  String? cityName;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Weather info = widget.data!;
    String temperature = info.temp.toString();
    String maxTemperature = info.tempMax.toString();
    String minTemperature = info.tempMin.toString();
    String city = info.city;
    String country = info.country;
    backgroundImage = info.weatherImage;
    backgroundColor = info.backgroundColor;
    mainColor = info.mainColor;
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      country,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 18, color: mainColor)),
                    ),
                    Text(city,
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(fontSize: 22, color: mainColor))),
                    Countup(
                        duration: Duration(milliseconds: 1100),
                        suffix: " C°",
                        begin: 0,
                        end: double.parse(temperature),
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 90, color: mainColor),
                        )),
                  ],
                ),
              ),
              Flexible(
                child: Image.asset(
                  backgroundImage,
                  color: mainColor,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Countup(
                          duration: Duration(milliseconds: 1100),
                          prefix: "max ",
                          suffix: " C°",
                          begin: 0,
                          end: double.parse(maxTemperature),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  TextStyle(fontSize: 30, color: mainColor)),
                        ),
                        Countup(
                          duration: Duration(milliseconds: 1100),
                          prefix: "min ",
                          suffix: " C°",
                          begin: 0,
                          end: double.parse(minTemperature),
                          style: GoogleFonts.roboto(
                              textStyle:
                                  TextStyle(fontSize: 30, color: mainColor)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                        onPressed: _showDialog,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.search, color: Colors.black)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
        );
      },
    );
  }
}
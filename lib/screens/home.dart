
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_flutter/data/models/weather/weather.dart';

class Home extends StatefulWidget {
  final Weather? data;
  const Home({Key? key, this.data}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  late AssetImage backgroundImage;
  late Color backgroundColorSearchButton;
  late Color iconColor;
  late Color mainColor;
  late IconData weatherIcon;
  late Color appBarColor;

  @override
  Widget build(BuildContext context) {
    Weather info = widget.data!;
    print(info.temp);
    String temperature = info.temp.toString();
    String maxTemperature = info.tempMax.toString();
    String minTemperature = info.tempMin.toString();
    String city = info.city;
    String country = info.country;
    String description = info.description.toString();
    String icon = info.icon;

    switch (icon) {
      case '01d':
        {
          _setThemeColor(AssetImage("assets/clear_sky_day.jpg"), Colors.white,
              Colors.white, Colors.black, Icons.wb_sunny, Colors.black);
        }
        break;

      case '01n':
        {
          _setThemeColor(
              AssetImage("assets/clear_sky_night.jpg"),
              Colors.blueAccent[800]!,
              Colors.white,
              Colors.blue,
              Icons.nightlight_round, Colors.black);
        }
        break;

      case '09d':
        {
          _setThemeColor(AssetImage("assets/morning_rain.jpg"), Colors.blueGrey,
              Colors.blueGrey, Colors.black, Icons.umbrella, Colors.blueGrey);
        }
        break;

      case '09n':
        {
          _setThemeColor(AssetImage("assets/night_rain.jpg"), Colors.white,
              Colors.white, Colors.black, Icons.umbrella, Colors.black);
        }
        break;

      case '11d':
        {
          _setThemeColor(AssetImage("assets/day_heavy_rain.jpg"), Colors.grey,
              Colors.grey, Colors.black, Icons.flash_on, Colors.grey);
        }
        break;
      case '11n':
        {
          _setThemeColor(
              AssetImage("assets/night_heavy_rain.jpg"),
              Colors.white,
              Colors.white,
              Colors.black,
              Icons.flash_on,
          Colors.black);
        }
        break;
      case '13d':
        {
          _setThemeColor(AssetImage("assets/snow_day.jpg"), Colors.white,
              Colors.white, Colors.black, Icons.flare, Colors.white);
        }
        break;
      case '13d':
        {
          _setThemeColor(AssetImage("assets/snow_night.jpg"), Colors.white70,
              Colors.white70, Colors.white70, Icons.flare, Colors.white70);
        }
        break;
      case '50d':
        {
          _setThemeColor(AssetImage("assets/mist.jpg"), Colors.white24,
              Colors.white24, Colors.white24, Icons.waves, Colors.white24);
        }
        break;
      case '50n':
        {
          _setThemeColor(AssetImage("assets/mist.jpg"), Colors.white24,
              Colors.white24, Colors.white24, Icons.waves, Colors.white24);
        }
        break;
      default:
        {
          _setThemeColor(AssetImage("assets/clouds_day.jpg"), Colors.white,
              Colors.white, Colors.black, Icons.wb_sunny_outlined, Colors.white);
          if ((icon == '02d') || (icon == '03d') || (icon == '04d')) {
          } else {
            _setThemeColor(AssetImage("assets/clouds_night.jpg"), Colors.white,
                Colors.white, Colors.black, Icons.wb_sunny_outlined, Colors.black);
          }
          break;
        }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: appBarColor,
        ),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                /** Main Section*/
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        country,
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      Text(city,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 22, color: Colors.white))),
                      SizedBox(height: 20,),
                      Icon(
                        weatherIcon,
                        size: MediaQuery.of(context).size.width/1.6,
                        color: mainColor,
                      ),
                      Countup(
                          duration: Duration(milliseconds: 1100),
                          suffix: " C°",
                          begin: 0,
                          end: double.parse(temperature),
                          style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(fontSize: 90, color: mainColor),
                          )),
                    ],
                  ),
                ),
                /** Card Section*/
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Countup(
                                          duration:
                                              Duration(milliseconds: 1100),
                                          prefix: "max  ",
                                          suffix: " C°",
                                          begin: 0,
                                          end: double.parse(maxTemperature),
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 30,
                                                  color: mainColor)),
                                        ),
                                        Countup(
                                          duration:
                                              Duration(milliseconds: 1100),
                                          prefix: "min  ",
                                          suffix: " C°",
                                          begin: 0,
                                          end: double.parse(minTemperature),
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  fontSize: 30,
                                                  color: mainColor)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              FloatingActionButton(
                                  onPressed: _showDialog,
                                  backgroundColor: mainColor,
                                  child: Icon(Icons.search, color: iconColor))
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  void _setThemeColor(
      AssetImage _backgroundImage,
      Color _backgroundColorSearchButton,
      Color _mainColor,
      Color _iconColor,
      IconData _weatherIcon,
      Color _appBarColor) {
    backgroundImage = _backgroundImage;
    backgroundColorSearchButton = _backgroundColorSearchButton;
    mainColor = _mainColor;
    iconColor = _iconColor;
    weatherIcon = _weatherIcon;
    appBarColor = _appBarColor;
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
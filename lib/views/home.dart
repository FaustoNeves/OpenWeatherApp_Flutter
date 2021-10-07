
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temperature = (((info['temperature']).toString()).substring(0, 2));
    String maxTemperature = ((info['temperature_max'].toString().substring(0,2)));
    String minTemperature = ((info['temperature_min'].toString().substring(0,2)));
    String city = info['city'];
    String country = info['country'];
    String description = info['description'].toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.blue[300]!,
                  Colors.blue[600]!,
                ])),
            child: Column(
              children: [
                /** Search textfield */
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white60),
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/loading", arguments: {
                            "searchText": searchController.text,
                          });
                        },
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "City name",
                          border: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                ),
                /** Main Section*/
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height/2,
                  // width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        country,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(city,
                          style: TextStyle(fontSize: 28, color: Colors.white)),
                      Text(
                        "$temperature C°",
                        style: TextStyle(fontSize: 108, color: Colors.white),
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 70, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.white),
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [Text("MAX temp"), Text(maxTemperature)],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [Text("MIN temp"), Text(minTemperature)],
                              ),
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
}

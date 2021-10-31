class Weather {
  late String temp;
  late String tempMin;
  late String tempMax;
  late String description;
  late String main;
  late String city;
  late String country;
  late String url;
  late String icon;

  Weather.fromMap(Map map) {
    Map mainData = map['main'];
    print(map.toString());
    temp = (mainData['temp'] - 273.15).toString();
    tempMax = (mainData['temp_max'] - 273.15).toString();
    tempMin = (mainData['temp_min'] - 273.15).toString();

    List weatherMainDataList = map['weather'];
    Map weatherMainData = weatherMainDataList[0];
    description = weatherMainData['description'];
    main = weatherMainData['main'];
    city = map['name'];

    Map sysData = map['sys'];
    country = sysData['country'];
    icon = weatherMainData['icon'];
  }

  Map<String, dynamic> weatherMap() {
    return <String, dynamic>{
      "temperature": temp,
      "temperature_min": tempMin,
      "temperature_max": tempMax,
      "description": description,
      "main": main,
      "city": city,
      "country": country,
      "icon": icon,
    };
  }
}

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
    temp = ((mainData['temp'] - 273.15).toString().substring(0, 2))
        .replaceAll("", "");
    tempMax = ((mainData['temp_max'] - 273.15).toString().substring(0, 2))
        .replaceAll("", "");
    tempMin = ((mainData['temp_min'] - 273.15).toString().substring(0, 2))
        .replaceAll("", "");

    List weatherMainDataList = map['weather'];
    Map weatherMainData = weatherMainDataList[0];
    description = weatherMainData['description'];
    main = weatherMainData['main'];
    city = map['name'];

    Map sysData = map['sys'];
    country = sysData['country'];
    icon = weatherMainData['icon'];
  }

  Map weatherMap() {
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

import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/data/models/location/location.dart';
import 'package:weather_app_flutter/data/repository/location_repository.dart';

class LocationController {
  LocationRepository locationRepository = LocationRepository();

  Future getCoordinates() async {
    return locationRepository.getCoordinates();
  }
}

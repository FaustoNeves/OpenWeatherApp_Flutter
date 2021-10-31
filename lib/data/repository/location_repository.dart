import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/data/models/location/location.dart';

class LocationRepository {
  Future<bool> _isServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> _checkLocationPermissions() async {
    return await Geolocator.checkPermission();
  }

  Future<LocationPermission> _requestLocationPermission() async {
    return await Geolocator.requestPermission();
  }

  Future<Position> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Location> getLocation() async {
    Position position = await _getCurrentPosition();

    return Location(
        position.latitude,
        position.longitude,
        await _isServiceEnabled(),
        await _checkLocationPermissions(),
        await _requestLocationPermission());
  }
}

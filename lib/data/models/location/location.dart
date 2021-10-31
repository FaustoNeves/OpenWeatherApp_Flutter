import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double lon;
  late bool serviceEnabled;
  late LocationPermission permissionAvailability;
  late LocationPermission requestPermission;

  Location(this.lat, this.lon, this.serviceEnabled, this.permissionAvailability,
      this.requestPermission);
}

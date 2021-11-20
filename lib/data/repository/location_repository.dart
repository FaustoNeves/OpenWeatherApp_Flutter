import 'package:geolocator/geolocator.dart';

/// Throws a [TimeoutException] when no location is received within the
/// supplied [timeLimit] duration.
/// Throws a [PermissionDeniedException] when trying to request the device's
/// location when the user denied access.
/// Throws a [LocationServiceDisabledException] when the user allowed access,
/// but the location services of the device are disabled.

class LocationRepository {
  Future getCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return {"lat": position.latitude, "lon": position.longitude};
  }
}

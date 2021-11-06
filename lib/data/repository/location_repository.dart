import 'package:geolocator/geolocator.dart';

class LocationRepository {
  Future getCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return {"lat": position.latitude, "lon": position.longitude};
  }
}
import 'package:geolocator/geolocator.dart';

class LocationRemote {
  Future getCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return {"lat": position.latitude, "lon": position.longitude};
  }
}
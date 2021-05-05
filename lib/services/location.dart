import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      this.longitude = position.longitude;
      this.latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}

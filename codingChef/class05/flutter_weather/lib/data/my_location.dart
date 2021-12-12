import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude2;
  double? longtitude;

  Future<void> getMyCurLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longtitude = position.longitude;
    } catch (e) {
      print('에러!');
    }
  }
}

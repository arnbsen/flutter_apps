import 'package:geolocator/geolocator.dart';

class GeoLocationHelper {

  Future<Position> getCurrentPosition() async {
    return Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }
}
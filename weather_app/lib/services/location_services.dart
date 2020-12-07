import 'package:geolocator/geolocator.dart';

class LocationServices {
  
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<dynamic> getLastKnownPosition() async {
    Position position = await Geolocator.getLastKnownPosition();
    if(position != null) {
      return position;
    } else {
      return "No known last position";
    }
  }

  Future<LocationPermission> requestPermissions() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  Future<LocationPermission> checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    return permission;
  }

}
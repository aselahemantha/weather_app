import 'package:geolocator/geolocator.dart';

class Location{

  late Position position;
  late double latitude;
  late double longitude;

  Future<void> getLocation() async {
    try{
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print(e);
    }
  }

}
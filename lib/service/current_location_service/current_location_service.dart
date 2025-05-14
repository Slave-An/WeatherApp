import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationService {
  Future<String?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Геолокация отключена';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Разрешение отклонено';
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return 'Разрешение заблокировано навсегда';
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> playcemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (playcemark.isNotEmpty) {
      return playcemark.first.locality;
    }
    return 'Город не найден';
  }
}

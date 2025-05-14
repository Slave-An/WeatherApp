import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/service/hive_service/model/hive_city_model.dart';

class HiveService {
  Box<HiveCityModel>? _cityBox;

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveCityModelAdapter());
    _cityBox = await Hive.openBox<HiveCityModel>('city_box');
  }

  Future<void> saveToHive(String cityName, String countryName) async {
    if (_cityBox == null) {
      throw Exception('Hive box is not initialized');
    }
    final cityKey = '$cityName,$countryName';
    final city = HiveCityModel(city: cityName, country: countryName);
    await _cityBox?.put(cityKey, city);
  }

  List<String> getAllCities() {
    return _cityBox!.values
        .map((city) => '${city.city}, ${city.country}')
        .toList();
  }

  void removeFromHive(String city) {
    final box = _cityBox;
    if (box == null) return;

    final key = box.keys.firstWhere(
      (k) => box.get(k)?.city == city,
      orElse: () => null,
    );

    if (key != null) {
      box.delete(key);
    }
  }

  bool checkSameCityOnHive(String selectedCity, String selectedCountry) {
    return _cityBox!.values.any(
      (entries) =>
          entries.city == selectedCity && entries.country == selectedCountry,
    );
  }
}

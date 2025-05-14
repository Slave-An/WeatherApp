import 'package:hive_flutter/adapters.dart';

part 'hive_city_model.g.dart';

@HiveType(typeId: 1)
class HiveCityModel {
  HiveCityModel({required this.city, required this.country});

  @HiveField(0)
  final String city;
  @HiveField(1)
  final String country;
}

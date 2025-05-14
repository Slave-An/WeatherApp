import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/service/dependency_injection_service/dependency_injection_service.dart';
import 'package:weather_app/service/hive_service/hive_service.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

  DependencyInjectionService().ititDI();
  await GetIt.I<HiveService>().initHive();
  runApp(const WeatherApp());
}

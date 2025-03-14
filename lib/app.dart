import 'package:flutter/material.dart';
import 'package:weather_app/router/router.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final route = AppRouter();
    return MaterialApp.router(
      routerConfig: route.config(),
    );
  }
}

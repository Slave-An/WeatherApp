import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/view/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          WeatherScreen(),
          Scaffold(),
          Scaffold(),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home_screen/widgets/page_dots.dart';
import 'package:weather_app/router/router.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.controller,
    required this.cities,
  });

  final PageController controller;
  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.blueAccent,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 40),
          PageDots(controller: controller, city: cities),
          IconButton(
            onPressed: () {
              context.replaceRoute(WeatherListRoute());
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/widgets/wind_widget/compas/compass_painter.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class Compass extends StatelessWidget {
  const Compass({
    super.key,
    required this.allForecast,
  });

  final AllWeatherForecast allForecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(140, 140),
            painter: CompassPainter(),
          ),
          Transform.rotate(
            angle: (allForecast.windDegree + 90) * (pi / 180),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Column(
              children: [
                Text(
                  '${(allForecast.windKpH / 3.6).toInt()}',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'mph',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

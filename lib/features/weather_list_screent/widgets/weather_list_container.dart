import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';
import 'package:weather_app/router/router.dart';

class WeatherListContainer extends StatelessWidget {
  const WeatherListContainer({
    super.key,
    required this.index,
    required this.weatherForecast,
  });

  final AllWeatherForecast weatherForecast;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
      child: GestureDetector(
        onTap: () {
          context.replaceRoute(HomeRoute(initialPage: index));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 120,
          width: MediaQuery.of(context).size.width - 24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherForecast.city,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Time',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Text(
                      '${weatherForecast.temperature.toInt()}°',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      weatherForecast.dailyCondition[0],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'H:${weatherForecast.dailyMaxTemp[0].toInt()}° L:${weatherForecast.dailyMinTemp[0].toInt()}°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

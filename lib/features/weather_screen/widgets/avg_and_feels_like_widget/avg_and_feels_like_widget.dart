import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/widgets/base_container.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class AvgAndFeelsLikeWidget extends StatelessWidget {
  const AvgAndFeelsLikeWidget({
    super.key,
    required this.allForecast,
  });

  final AllWeatherForecast allForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseContainer(
            height: 170,
            width: (MediaQuery.of(context).size.width - 48) / 2,
            title: Row(
              children: [
                Icon(
                  Icons.show_chart_sharp,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  'Avg Temp',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            child: Center(
              child: Text(
                allForecast.avgTemp > 0
                    ? '+${allForecast.avgTemp}°'
                    : '${allForecast.avgTemp}°',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          BaseContainer(
            height: 170,
            width: (MediaQuery.of(context).size.width - 48) / 2,
            title: Row(
              children: [
                Icon(
                  Icons.thermostat,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  'Feels like',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${allForecast.feelsLike.toInt()}°',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Actual: ${allForecast.temperature.toInt()}°',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

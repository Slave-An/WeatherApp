import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/widgets/base_container.dart';
import 'package:weather_app/features/weather_screen/widgets/wind_widget/compas/compass.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({
    super.key,
    required this.allForecast,
  });

  final AllWeatherForecast allForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BaseContainer(
        height: 200,
        title: Row(
          children: [
            Icon(
              Icons.wind_power_outlined,
              size: 20,
              color: Colors.white,
            ),
            Text(
              'Wind',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width - 24,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wind',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${(allForecast.windKpH / 3.6).toInt()} mhp',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Gust:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${(allForecast.gustKph / 3.6).toInt()} mph',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Direction',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${allForecast.windDegree}° ${allForecast.windDir}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Compass(allForecast: allForecast),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({
    super.key,
    required this.forecast,
  });
  final AllWeatherForecast forecast;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      floating: false,
      pinned: true,
      backgroundColor: Colors.blueAccent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double percent =
              (constraints.maxHeight - kToolbarHeight) / (250 - kToolbarHeight);
          percent = percent.clamp(0.0, 1.0);

          return FlexibleSpaceBar(
            title: Opacity(
              opacity: 1 - percent.clamp(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          forecast.city,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      '${forecast.temperature.toInt()}°C • Ощущается как ${forecast.feelsLike.toInt()}°C',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            background: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: percent.clamp(0.0, 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          forecast.city,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: percent.clamp(0.0, 1.0),
                    child: Text(
                      '${forecast.temperature.toInt()}°C',
                      style: TextStyle(fontSize: 64, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Opacity(
                    opacity: percent.clamp(0.0, 1.0),
                    child: Text(
                      "Ощущается как ${forecast.feelsLike.toInt()}°C",
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      toolbarHeight: 60,
    );
  }
}

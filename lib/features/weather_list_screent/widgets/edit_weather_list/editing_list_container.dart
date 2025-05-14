import 'package:flutter/material.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class EditingListContainer extends StatelessWidget {
  const EditingListContainer({
    super.key,
    required this.allWeatherForecast,
    required this.horizPadding,
    required this.subTitle,
  });

  final AllWeatherForecast allWeatherForecast;
  final double horizPadding;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: horizPadding,
        right: horizPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 60,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 4, right: 12, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allWeatherForecast.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Text(
                  '${allWeatherForecast.temperature.toInt()}°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

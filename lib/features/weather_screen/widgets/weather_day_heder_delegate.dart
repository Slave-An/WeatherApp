import 'package:flutter/material.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WeatherDayHeaderDelegate extends SliverPersistentHeaderDelegate {
  WeatherDayHeaderDelegate({required this.forecast});
  final AllWeatherForecast forecast;

  @override
  double get minExtent => 170;
  @override
  double get maxExtent => 170;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = 1 - (shrinkOffset / maxExtent);
    opacity = opacity.clamp(0.0, 1.0);

    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12).copyWith(top: 10),
          decoration: BoxDecoration(
              color: Color(0xFF007BFF),
              borderRadius: BorderRadius.circular(19)),
          child: Column(
            children: [
              Text("Прогноз на день",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              Divider(),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: forecast.hourCondition.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              Text("${forecast.hourTime[index].hour}:00",
                                  style: TextStyle(color: Colors.white)),
                              Image.network(
                                forecast.hourImageUrl[index],
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                "${forecast.hourTemperature[index].toInt()}°C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

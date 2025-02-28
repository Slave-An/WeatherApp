import 'package:flutter/material.dart';
import 'package:weather_app/reposytories/weather_forecast/model/all_weather_forecast.dart';

class WeatherTenDayHeaderDelegate extends SliverPersistentHeaderDelegate {
  WeatherTenDayHeaderDelegate({required this.forecast});
  final AllWeatherForecast forecast;

  @override
  double get minExtent => 545;
  @override
  double get maxExtent => 545;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12).copyWith(top: 10),
        decoration: BoxDecoration(
          color: Color(0xFF007BFF),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          children: [
            Text("10-days forecast",
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 5),
            Divider(),
            SizedBox(
              height: 470,
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: forecast.dailyCondition.length,
                  itemBuilder: (context, index) {
                    DateTime forecastDate =
                        DateTime.parse(forecast.dailyDate[index]);
                    String dayName = _getDayName(forecastDate);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          index == 0 ? dayName : dayName.substring(0, 3),
                          style: TextStyle(color: Colors.white),
                        ),
                        Image.network(forecast.dailyImageUrl[index],
                            width: 32, height: 32),
                        Text(
                          'Min: ${forecast.dailyMinTemp[index].toInt()}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Max: ${forecast.dailyMaxTemp[index].toInt()}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayName(DateTime date) {
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[date.weekday - 1]; // Получаем имя дня недели
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

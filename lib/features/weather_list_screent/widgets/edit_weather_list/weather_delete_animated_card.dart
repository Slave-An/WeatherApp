import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_list_screent/widgets/edit_weather_list/editing_list_container.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WeatherDeleteAnimatedCard extends StatelessWidget {
  const WeatherDeleteAnimatedCard({
    super.key,
    required this.allWeatherForecast,
    required this.isActive,
    required this.onActive,
    required this.city,
    required this.onDelete,
  });

  final String city;
  final AllWeatherForecast allWeatherForecast;
  final bool isActive;
  final VoidCallback onActive;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: isActive ? 10 : -80,
            top: 10,
            child: AnimatedOpacity(
              opacity: isActive ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: onDelete,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isActive ? -70 : 0,
            right: isActive ? 70 : 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onActive,
                    icon: Icon(Icons.remove_circle, color: Colors.red),
                  ),
                  Expanded(
                    child: EditingListContainer(
                      allWeatherForecast: allWeatherForecast,
                      horizPadding: 0,
                      subTitle: 'Time',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO
                    },
                    icon: Icon(Icons.menu),
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

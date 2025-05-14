import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/widgets/base_container.dart';
import 'package:weather_app/features/weather_screen/widgets/humidity_and_pressure_widget/pressure_gauge.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class HumidityAndPresureWidget extends StatelessWidget {
  const HumidityAndPresureWidget({
    super.key,
    required this.allForecast,
  });

  final AllWeatherForecast allForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseContainer(
            title: Row(
              children: [
                Icon(
                  Icons.water_drop,
                  size: 20,
                  color: Colors.white,
                ),
                const Text(
                  'Humidity',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            width: (MediaQuery.of(context).size.width - 48) / 2,
            height: 170,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      '${allForecast.humidity}%',
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          BaseContainer(
            title: Row(
              children: [
                const Text(
                  'Pressure',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            width: (MediaQuery.of(context).size.width - 48) / 2,
            height: 170,
            child: Column(
              children: [
                Center(
                  child: PressureGauge(
                    value: allForecast.presureMb,
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

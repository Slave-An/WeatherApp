import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/widgets/custom_sliver_app_bar.dart';
import 'package:weather_app/features/weather_screen/widgets/weather_day_heder_delegate.dart';
import 'package:weather_app/features/weather_screen/widgets/weather_ten_days_header_delegate.dart';
import 'package:weather_app/reposytories/current_location_reposytory/current_location_reposytory.dart';
import 'package:weather_app/reposytories/weather_forecast/model/all_weather_forecast.dart';

import 'package:weather_app/reposytories/weather_forecast/weather_forecast_reposytory.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherForecastReposytory reposytory = WeatherForecastReposytory();
  late final AllWeatherForecast allForecast;
  late final String? city;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  void _loadWeather() async {
    try {
      city = await CurrentLocationReposytory().getCurrentLocation();

      if (city != null) {
        allForecast = await reposytory.getAllForecast(city!);
      }
    } catch (e) {
      errorMessage = 'Ошибка загрузки: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(child: Text(errorMessage)),
      );
    }
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: CustomScrollView(
        slivers: [
          WeatherAppBar(
            city: city!,
            forecast: allForecast,
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: WeatherDayHeaderDelegate(forecast: allForecast),
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: WeatherTenDayHeaderDelegate(forecast: allForecast),
          ),
          SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              })
        ],
      ),
    );
  }
}

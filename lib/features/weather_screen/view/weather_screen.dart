import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_screen/widgets/avg_and_feels_like_widget/avg_and_feels_like_widget.dart';
import 'package:weather_app/features/weather_screen/widgets/custom_sliver_app_bar.dart';
import 'package:weather_app/features/weather_screen/widgets/humidity_and_pressure_widget/humidity_and_presure_widget.dart';
import 'package:weather_app/features/weather_screen/widgets/weather_day_heder_delegate.dart';
import 'package:weather_app/features/weather_screen/widgets/weather_ten_days_header_delegate.dart';
import 'package:weather_app/features/weather_screen/widgets/wind_widget/wing_widget.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
    required this.allForecast,
    this.cancelButton,
    this.addButton,
    required this.topPadding,
    this.controller,
  });
  final AllWeatherForecast allForecast;
  final Widget? cancelButton;
  final Widget? addButton;
  final double topPadding;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: CustomScrollView(
        controller: controller,
        slivers: [
          WeatherAppBar(
            forecast: allForecast,
            cancelButton: cancelButton,
            addbutton: addButton,
            topPadding: topPadding,
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: WeatherDayHeaderDelegate(forecast: allForecast),
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: WeatherTenDayHeaderDelegate(forecast: allForecast),
          ),
          SliverToBoxAdapter(
            child: AvgAndFeelsLikeWidget(allForecast: allForecast),
          ),
          SliverToBoxAdapter(child: WindWidget(allForecast: allForecast)),
          SliverToBoxAdapter(
            child: HumidityAndPresureWidget(allForecast: allForecast),
          ),
        ],
      ),
    );
  }
}

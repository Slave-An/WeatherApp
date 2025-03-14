import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_screen/widgets/avg_and_feels_like_widget/avg_and_feels_like_widget.dart';
import 'package:weather_app/features/weather_screen/widgets/custom_sliver_app_bar.dart';
import 'package:weather_app/features/weather_screen/widgets/humidity_and_pressure_widget/humidity_and_presure_widget.dart';
import 'package:weather_app/features/weather_screen/widgets/weather_day_heder_delegate.dart';
import 'package:weather_app/features/weather_screen/widgets/weather_ten_days_header_delegate.dart';
import 'package:weather_app/features/weather_screen/widgets/wind_widget/wing_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(LoadWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            final allForecast = state.weatherForecast;
            return RefreshIndicator(
              onRefresh: () async {
                final completer = Completer();
                context
                    .read<WeatherBloc>()
                    .add(LoadWeather(completer: completer));
                await completer.future;
              },
              child: CustomScrollView(
                slivers: [
                  WeatherAppBar(
                    forecast: allForecast,
                  ),
                  SliverPersistentHeader(
                    pinned: false,
                    delegate: WeatherDayHeaderDelegate(forecast: allForecast),
                  ),
                  SliverPersistentHeader(
                    pinned: false,
                    delegate:
                        WeatherTenDayHeaderDelegate(forecast: allForecast),
                  ),
                  SliverToBoxAdapter(
                    child: AvgAndFeelsLikeWidget(allForecast: allForecast),
                  ),
                  SliverToBoxAdapter(
                    child: WindWidget(allForecast: allForecast),
                  ),
                  SliverToBoxAdapter(
                    child: HumidityAndPresureWidget(allForecast: allForecast),
                  )
                ],
              ),
            );
          } else if (state is WearherLoadingFailure) {
            return Center(
              child: Text('Error: ${state.exeption}'),
            );
          }
          return Center(
            child: Text('No weather data avalible'),
          );
        },
      ),
    );
  }
}

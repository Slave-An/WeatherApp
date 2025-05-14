import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_screen/view/weather_screen.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({
    super.key,
    required this.cities,
    required this.controller,
  });

  final List<String> cities;
  final PageController controller;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(LoadAllWeather(cities: widget.cities));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AllWeatherLoaded) {
          final allForecast = state.allWeatherForecast;
          return RefreshIndicator(
            onRefresh: () async {
              final completer = Completer();
              context.read<WeatherBloc>().add(
                LoadAllWeather(cities: widget.cities),
              );
              await completer.future;
            },
            child: PageView.builder(
              controller: widget.controller,
              itemCount: widget.cities.length + 1,
              itemBuilder: (context, index) {
                return WeatherScreen(
                  allForecast: allForecast[index],
                  topPadding: MediaQuery.of(context).padding.top + 10,
                );
              },
            ),
          );
        } else if (state is WeatherLoadingFailure) {
          return Center(child: Text('Error: ${state.exception}'));
        }
        return Center(child: Text('No weather data avalible'));
      },
    );
  }
}

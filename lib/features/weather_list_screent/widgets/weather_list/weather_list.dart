import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list_container.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({super.key, required this.city});
  final List<String> city;

  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(LoadAllWeather(cities: widget.city));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AllWeatherLoaded) {
          final allWeatherForecase = state.allWeatherForecast;
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.only(bottom: 30),
            itemCount: widget.city.length + 1,
            itemBuilder: (context, index) {
              return WeatherListContainer(
                index: index,
                weatherForecast: allWeatherForecase[index],
              );
            },
          );
        } else if (state is WeatherLoadingFailure) {
          return Center(child: Text('Error: ${state.exception}'));
        }
        return const Center(child: Text('No weather data availible'));
      },
    );
  }
}

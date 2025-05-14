import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_screen/view/weather_screen.dart';
import 'package:weather_app/service/hive_service/hive_service.dart';

class AddWeatherModalBottomSheet extends StatefulWidget {
  const AddWeatherModalBottomSheet({
    super.key,
    required this.city,
    required this.country,
  });

  final String city;
  final String country;

  @override
  State<AddWeatherModalBottomSheet> createState() =>
      _AddWeatherModalBottomSheetState();
}

class _AddWeatherModalBottomSheetState
    extends State<AddWeatherModalBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(
      LoadWeather(city: '${widget.city} ${widget.country}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.92,
        maxChildSize: 0.92,
        minChildSize: 0.7,
        builder: (context, scrollController) {
          return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherLoaded) {
                final weatherForecast = state.weatherForecast;
                return WeatherScreen(
                  controller: scrollController,
                  allForecast: weatherForecast,
                  cancelButton: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  addButton:
                      GetIt.I<HiveService>().checkSameCityOnHive(
                            widget.city,
                            widget.country,
                          )
                          ? SizedBox.shrink()
                          : TextButton(
                            onPressed: () {
                              GetIt.I<HiveService>().saveToHive(
                                widget.city,
                                widget.country,
                              );
                              Navigator.of(context).pop();

                              context.read<WeatherListBloc>().add(
                                CancelSearch(),
                              );
                              context.read<WeatherListBloc>().add(
                                LoadDataFromHive(),
                              );
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                  topPadding: 12,
                );
              } else if (state is WeatherLoadingFailure) {
                return Center(child: Text('Error: ${state.exception}'));
              }
              return Center(child: Text('No data avalible'));
            },
          );
        },
      ),
    );
  }
}

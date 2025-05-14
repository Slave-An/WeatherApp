import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather_list_screent/widgets/edit_weather_list/editing_list_container.dart';
import 'package:weather_app/features/weather_list_screent/widgets/edit_weather_list/weather_delete_animated_card.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';
import 'package:weather_app/service/hive_service/hive_service.dart';

class EditWeatherList extends StatefulWidget {
  const EditWeatherList({super.key, required this.cities});

  final List<String> cities;

  @override
  State<EditWeatherList> createState() => _EditWeatherListState();
}

class _EditWeatherListState extends State<EditWeatherList> {
  late List<String> _localCities;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _localCities = List.from(widget.cities);
  }

  void _removeItem(
    int index,
    String city,
    AllWeatherForecast allWeatherForecast,
  ) {
    final removedItem = _localCities.removeAt(index);
    _listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: WeatherDeleteAnimatedCard(
          city: removedItem,
          allWeatherForecast: allWeatherForecast,
          isActive: false,
          onActive: () {},
          onDelete: () {},
        ),
      );
    }, duration: const Duration(milliseconds: 300));

    GetIt.I<HiveService>().removeFromHive(city.split(',').first);
  }

  int? activeIndex;
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
          final allWeatherForecast = state.allWeatherForecast;
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                activeIndex = null;
              });
            },
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _localCities.length + 1,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(bottom: 30),
              itemBuilder: (context, index, animation) {
                if (index == 0) {
                  return Row(
                    children: [
                      Expanded(
                        child: EditingListContainer(
                          allWeatherForecast: allWeatherForecast[index],
                          horizPadding: 15,
                          subTitle: 'Моя геопозиція',
                        ),
                      ),
                    ],
                  );
                }
                final city = _localCities[index - 1];
                final forecast = allWeatherForecast.firstWhere(
                  (f) => f.city == city.split(',').first,
                  orElse: () => allWeatherForecast[0],
                );
                return SizeTransition(
                  sizeFactor: animation,
                  child: WeatherDeleteAnimatedCard(
                    city: city,
                    allWeatherForecast: forecast,
                    isActive: activeIndex == index,
                    onActive: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        activeIndex = null;
                        _removeItem(index, city, forecast);
                      });
                    },
                  ),
                );
              },
            ),
          );
        }
        return ListView();
      },
    );
  }
}

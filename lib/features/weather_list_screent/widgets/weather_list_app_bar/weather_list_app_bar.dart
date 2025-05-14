import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list_app_bar/search_city_text_field.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list_app_bar/weather_list_search_bar.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';

class WeatherListAppBar extends StatelessWidget {
  const WeatherListAppBar({
    super.key,
    required this.isSearching,
    required this.isChanging,
  });

  final bool isSearching;
  final bool isChanging;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: isSearching ? kToolbarHeight : 130,
      floating: false,
      pinned: true,
      backgroundColor: Colors.black,
      title:
          isSearching
              ? SearchCityTextField()
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  isChanging
                      ? TextButton(
                        onPressed: () {
                          context.read<WeatherListBloc>().add(AplyChanges());
                          context.read<WeatherListBloc>().add(
                            LoadDataFromHive(),
                          );
                        },
                        child: Text(
                          'Готово',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                      : PopupMenuButton<String>(
                        color: const Color.fromARGB(255, 41, 41, 41),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        icon: const Icon(Icons.more_horiz, color: Colors.white),
                        onSelected: (value) {
                          if (value == 'edit') {
                            context.read<WeatherListBloc>().add(
                              ChangeWeatherList(),
                            );
                          }
                        },
                        itemBuilder:
                            (context) => <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Text(
                                        'Змінити список',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                      ),
                ],
              ),
      actions:
          isSearching
              ? [
                TextButton(
                  onPressed: () {
                    context.read<WeatherListBloc>().add(CancelSearch());
                    context.read<WeatherListBloc>().add(LoadDataFromHive());
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ]
              : [],
      bottom:
          isSearching
              ? null
              : PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: GestureDetector(
                    onTap:
                        () =>
                            context.read<WeatherListBloc>().add(StartSearch()),
                    child: const WeatherListSearchBar(),
                  ),
                ),
              ),
    );
  }
}

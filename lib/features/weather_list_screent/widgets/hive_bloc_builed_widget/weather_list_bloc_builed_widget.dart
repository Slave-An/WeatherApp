import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_list_screent/widgets/edit_weather_list/edit_weather_list.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list/weather_list.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list_app_bar/search_result_list.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list_app_bar/weather_list_app_bar.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';

class WeatherListBlocBuiledWidget extends StatefulWidget {
  const WeatherListBlocBuiledWidget({super.key});

  @override
  State<WeatherListBlocBuiledWidget> createState() =>
      _WeatherListBlocBuiledWidgetState();
}

class _WeatherListBlocBuiledWidgetState
    extends State<WeatherListBlocBuiledWidget> {
  bool isSearching = false;
  bool isChanging = false;
  List<String> cities = [];
  @override
  void initState() {
    super.initState();
    context.read<WeatherListBloc>().add(LoadDataFromHive());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherListBloc, WeatherListState>(
      builder: (context, state) {
        if (state is SearchActive ||
            state is AutocompleteLoading ||
            state is AutocompleteLoaded) {
          isSearching = true;
        } else if (state is SearchInactive || state is DataFromHiveLoaded) {
          isSearching = false;
        }
        isChanging = state is ChangeActive;
        Widget sliverBody = SliverToBoxAdapter(child: SizedBox.shrink());
        if (state is WeatherListLoading) {
          sliverBody = SliverFillRemaining(
            child: SizedBox.expand(
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is DataFromHiveLoaded) {
          cities = state.cities;
          sliverBody = SliverToBoxAdapter(child: WeatherList(city: cities));
        } else if (state is AutocompleteLoaded) {
          sliverBody = SliverToBoxAdapter(
            child: SearchResultsList(cities: state.places),
          );
        } else if (state is ChangeActive) {
          sliverBody = SliverToBoxAdapter(
            child: EditWeatherList(cities: cities),
          );
        } else if (state is WeatherListLoadingFailure) {
          return Center(child: Text('${state.exception}'));
        }

        return CustomScrollView(
          slivers: [
            WeatherListAppBar(isSearching: isSearching, isChanging: isChanging),
            sliverBody,
          ],
        );
      },
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home_screen/widgets/custom_bottom_app_bar.dart';
import 'package:weather_app/features/home_screen/widgets/page_view_widget/page_view_widget.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/service/hive_service/hive_service.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.initialPage = 0});

  final int initialPage;

  @override
  Widget build(BuildContext context) {
    final List<String> cities = GetIt.I<HiveService>().getAllCities();
    final PageController controller = PageController(initialPage: initialPage);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: BlocProvider(
        create: (_) => GetIt.I<WeatherBloc>(),
        child: PageViewWidget(cities: cities, controller: controller),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        controller: controller,
        cities: cities,
      ),
    );
  }
}

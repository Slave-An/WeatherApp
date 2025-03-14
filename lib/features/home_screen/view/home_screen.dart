import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_screen/view/weather_screen.dart';
import 'package:weather_app/repositories/weather_forecast/weather_forecast_repository.dart';
import 'package:weather_app/service/current_location_service/current_location_service.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      WeatherScreen(),
      WeatherScreen(),
      WeatherScreen()
    ];
    final PageController controller = PageController();
    final WeatherForecastRepository repository = WeatherForecastRepository();
    final CurrentLocationService locationService = CurrentLocationService();
    return Scaffold(
      body: BlocProvider(
        create: (_) => WeatherBloc(repository, locationService),
        child: PageView.builder(
          controller: controller,
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return screens[index];
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blueAccent,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: screens.length,
                  effect: WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}

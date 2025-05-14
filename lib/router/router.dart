import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home_screen/view/home_screen.dart';
import 'package:weather_app/features/weather_list_screent/view/weather_list_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: WeatherListRoute.page, path: '/weather/list'),
  ];
}

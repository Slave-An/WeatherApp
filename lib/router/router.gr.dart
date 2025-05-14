// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter();

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(key: args.key, initialPage: args.initialPage),
      );
    },
    WeatherListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeatherListScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key, int initialPage = 0, List<PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key, initialPage: initialPage),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.initialPage = 0});

  final Key? key;

  final int initialPage;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, initialPage: $initialPage}';
  }
}

/// generated route for
/// [WeatherListScreen]
class WeatherListRoute extends PageRouteInfo<void> {
  const WeatherListRoute({List<PageRouteInfo>? children})
    : super(WeatherListRoute.name, initialChildren: children);

  static const String name = 'WeatherListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

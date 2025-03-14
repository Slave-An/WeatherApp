import 'package:auto_route/auto_route.dart';
import 'package:weather_app/features/home_screen/view/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
        ),
      ];
}

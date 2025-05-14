import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_app/repositories/autocomplite_repository/abstract_autocomplete_repository.dart';
import 'package:weather_app/repositories/autocomplite_repository/autocomplete_repository.dart';
import 'package:weather_app/repositories/weather_forecast/abstract_weather_forecast_repository.dart';
import 'package:weather_app/repositories/weather_forecast/weather_forecast_repository.dart';
import 'package:weather_app/service/current_location_service/current_location_service.dart';
import 'package:weather_app/service/env_service/env_service.dart';
import 'package:weather_app/service/hive_service/hive_service.dart';

class DependencyInjectionService {
  void ititDI() {
    GetIt.I.registerSingleton<EnvService>(EnvService()..initEnv());

    GetIt.I.registerLazySingleton<Dio>(() => Dio());
    GetIt.I.registerSingleton<AbstractWeatherForecastRepository>(
      WeatherForecastRepository(
        dio: GetIt.I<Dio>(),
        apiKey: GetIt.I<EnvService>().forecastApiKey,
        apiUrl: GetIt.I<EnvService>().forecastApiUrl,
      ),
    );
    GetIt.I.registerSingleton<AbstractAutocompleteRepository>(
      AutocompliteRepository(
        dio: GetIt.I<Dio>(),
        apiKey: GetIt.I<EnvService>().autocompliteApiKey,
      ),
    );
    GetIt.I.registerLazySingleton<CurrentLocationService>(
      () => CurrentLocationService(),
    );

    GetIt.I.registerFactory(
      () => WeatherBloc(
        GetIt.I<AbstractWeatherForecastRepository>(),
        GetIt.I<CurrentLocationService>(),
      ),
    );

    GetIt.I.registerSingleton<HiveService>(HiveService());

    GetIt.I.registerFactory(
      () => WeatherListBloc(
        GetIt.I<AbstractAutocompleteRepository>(),
        GetIt.I<HiveService>(),
      ),
    );
  }
}

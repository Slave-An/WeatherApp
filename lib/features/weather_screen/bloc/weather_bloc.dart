import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repositories/weather_forecast/abstract_weather_forecast_repository.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';
import 'package:weather_app/service/current_location_service/current_location_service.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final AbstractWeatherForecastRepository weatherForecastRepository;
  final CurrentLocationService currentLocationService;
  WeatherBloc(
    this.weatherForecastRepository,
    this.currentLocationService,
  ) : super(WeatherInitial()) {
    on<LoadWeather>((event, emit) async {
      try {
        if (state is! WeatherLoaded) {
          emit(WeatherLoading());
        }

        final city = await currentLocationService.getCurrentLocation();
        if (city == null || city.isEmpty) {
          emit(WearherLoadingFailure(exeption: 'City not found'));
          return;
        }

        final weatherForecast =
            await weatherForecastRepository.getAllForecast(city);
        final now = DateTime.now();
        final filteredHourTime = <DateTime>[];
        final filteredHourTemperature = <double>[];
        final filteredHourCondition = <String>[];
        final filteredHourImageUrl = <String>[];

        for (int i = 0; i < weatherForecast.hourTime.length; i++) {
          if (weatherForecast.hourTime[i].isAfter(now) &&
              weatherForecast.hourTime[i]
                  .isBefore(now.add(Duration(hours: 24)))) {
            filteredHourTime.add(weatherForecast.hourTime[i]);
            filteredHourTemperature.add(weatherForecast.hourTemperature[i]);
            filteredHourCondition.add(weatherForecast.hourCondition[i]);
            filteredHourImageUrl.add(weatherForecast.hourImageUrl[i]);
          }
        }

        final filteredWeatherForecast = AllWeatherForecast(
            city: weatherForecast.city,
            temperature: weatherForecast.temperature,
            feelsLike: weatherForecast.feelsLike,
            windKpH: weatherForecast.windKpH,
            windDegree: weatherForecast.windDegree,
            windDir: weatherForecast.windDir,
            gustKph: weatherForecast.gustKph,
            humidity: weatherForecast.humidity,
            visKm: weatherForecast.visKm,
            presureMb: weatherForecast.presureMb,
            avgTemp: weatherForecast.avgTemp,
            hourTime: filteredHourTime,
            hourTemperature: filteredHourTemperature,
            hourCondition: filteredHourCondition,
            hourImageUrl: filteredHourImageUrl,
            dailyDate: weatherForecast.dailyDate,
            dailyMinTemp: weatherForecast.dailyMinTemp,
            dailyMaxTemp: weatherForecast.dailyMaxTemp,
            dailyCondition: weatherForecast.dailyCondition,
            dailyImageUrl: weatherForecast.dailyImageUrl);

        emit(WeatherLoaded(weatherForecast: filteredWeatherForecast));
      } catch (e) {
        emit(WearherLoadingFailure(exeption: e.toString()));
      } finally {
        event.completer?.complete();
      }
    });
  }
}

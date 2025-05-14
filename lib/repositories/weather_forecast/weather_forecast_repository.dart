import 'package:dio/dio.dart';
import 'package:weather_app/repositories/weather_forecast/abstract_weather_forecast_repository.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WeatherForecastRepository implements AbstractWeatherForecastRepository {
  WeatherForecastRepository({
    required this.dio,
    required this.apiKey,
    required this.apiUrl,
  });

  final Dio dio;
  final String apiKey;
  final String apiUrl;

  @override
  Future<List<AllWeatherForecast>> getAllForecast(List<String> city) async {
    final List<AllWeatherForecast> data = [];
    for (var i = 0; i < city.length; i++) {
      final request = await dio.get(
        apiUrl,
        queryParameters: {'key': apiKey, 'q': city[i], 'days': 10},
      );
      data.add(AllWeatherForecast.fromJson(request.data));
    }

    return data;
  }

  @override
  Future<AllWeatherForecast> getForecast(String city) async {
    final request = await dio.get(
      apiUrl,
      queryParameters: {'key': apiKey, 'q': city, 'days': 10},
    );
    return AllWeatherForecast.fromJson(request.data);
  }
}

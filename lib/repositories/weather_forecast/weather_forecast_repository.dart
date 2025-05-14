import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/repositories/weather_forecast/abstract_weather_forecast_repository.dart';
import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

class WeatherForecastRepository implements AbstractWeatherForecastRepository {
  @override
  Future<AllWeatherForecast> getAllForecast(String city) async {
    final Dio dio = Dio();
    final String apiKey = dotenv.env['API_KEY']!;
    final String apiUrl = dotenv.env['API_URL']!;
    final request = await dio.get(
      apiUrl,
      queryParameters: {
        'key': apiKey,
        'q': city,
        'days': 10,
      },
    );

    final data = request.data;
    return AllWeatherForecast.fromJson(data);
  }
}

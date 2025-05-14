import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

abstract class AbstractWeatherForecastRepository {
  Future<List<AllWeatherForecast>> getAllForecast(List<String> city);
  Future<AllWeatherForecast> getForecast(String city);
}

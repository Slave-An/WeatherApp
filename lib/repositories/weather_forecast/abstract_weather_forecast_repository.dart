import 'package:weather_app/repositories/weather_forecast/model/all_weather_forecast.dart';

abstract class AbstractWeatherForecastRepository {
  Future<AllWeatherForecast> getAllForecast(String city);
}

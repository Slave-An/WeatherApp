import 'package:dio/dio.dart';
import 'package:weather_app/reposytories/weather_forecast/model/all_weather_forecast.dart';

class WeatherForecastReposytory {
  Future<AllWeatherForecast> getAllForecast(String city) async {
    final Dio dio = Dio();
    final String apiKey = '37f7530df33a4e4d819111516251902';
    final request = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        'key': apiKey,
        'q': city,
        'days': 10,
      },
    );

    final data = request.data;
    final curretData = data['current'];
    final List<dynamic> forecast = data['forecast']['forecastday'];

    final List<DateTime> hourTime = [];
    final List<double> hourTemperature = [];
    final List<String> hourCondition = [];
    final List<String> hourImageUrl = [];

    DateTime now = DateTime.now();

    for (var day in forecast) {
      List<dynamic> hours = day['hour'];
      for (var hour in hours) {
        DateTime hourTimes = DateTime.parse(hour['time']);
        if (hourTimes.isAfter(now) && hourTime.length < 24) {
          final condition = hour["condition"];

          hourTime.add(hourTimes);
          hourTemperature.add(hour['temp_c']);
          hourCondition.add(condition["text"]);
          hourImageUrl.add("https:${condition['icon']}");
        }
      }
    }

    final List<String> dailyDate = [];
    final List<double> dailyMinTemp = [];
    final List<double> dailyMaxTemp = [];
    final List<String> dailyCondition = [];
    final List<String> dailyImageUrl = [];

    for (var daily in forecast) {
      final day = daily['day'];
      final condition = day['condition'];

      dailyDate.add(daily['date']);
      dailyMinTemp.add(day['mintemp_c']);
      dailyMaxTemp.add(day["maxtemp_c"]);
      dailyCondition.add(condition['text']);
      dailyImageUrl.add('https:${condition['icon']}');
    }

    return AllWeatherForecast(
      temperature: curretData['temp_c'],
      feelsLike: curretData['feelslike_c'],
      hourTime: hourTime,
      hourTemperature: hourTemperature,
      hourCondition: hourCondition,
      hourImageUrl: hourImageUrl,
      dailyDate: dailyDate,
      dailyMinTemp: dailyMinTemp,
      dailyMaxTemp: dailyMaxTemp,
      dailyCondition: dailyCondition,
      dailyImageUrl: dailyImageUrl,
    );
  }
}

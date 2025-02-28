class AllWeatherForecast {
  AllWeatherForecast({
    required this.temperature,
    required this.feelsLike,
    required this.hourTime,
    required this.hourTemperature,
    required this.hourCondition,
    required this.hourImageUrl,
    required this.dailyDate,
    required this.dailyMinTemp,
    required this.dailyMaxTemp,
    required this.dailyCondition,
    required this.dailyImageUrl,
  });

  final double temperature;
  final double feelsLike;

  final List<DateTime> hourTime;
  final List<double> hourTemperature;
  final List<String> hourCondition;
  final List<String> hourImageUrl;

  final List<String> dailyDate;
  final List<double> dailyMinTemp;
  final List<double> dailyMaxTemp;
  final List<String> dailyCondition;
  final List<String> dailyImageUrl;
}

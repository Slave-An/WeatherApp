class AllWeatherForecast {
  AllWeatherForecast({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.windKpH,
    required this.windDegree,
    required this.windDir,
    required this.gustKph,
    required this.visKm,
    required this.presureMb,
    required this.humidity,
    required this.avgTemp,
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
  final String city;
  final double temperature;
  final double feelsLike;

  final double windKpH;
  final int windDegree;
  final String windDir;
  final double gustKph;

  final double visKm;
  final int presureMb;
  final int humidity;
  final int avgTemp;

  final List<DateTime> hourTime;
  final List<double> hourTemperature;
  final List<String> hourCondition;
  final List<String> hourImageUrl;

  final List<String> dailyDate;
  final List<double> dailyMinTemp;
  final List<double> dailyMaxTemp;
  final List<String> dailyCondition;
  final List<String> dailyImageUrl;

  factory AllWeatherForecast.fromJson(Map<String, dynamic> json) {
    return AllWeatherForecast(
      city: json['location']['name']?.toString() ?? 'City not found',
      temperature: json['current']['temp_c']?.toDouble() ?? 0.0,
      feelsLike: json['current']['feelslike_c']?.toDouble() ?? 0.0,
      windKpH: json['current']['wind_kph']?.toDouble() ?? 0.0,
      windDegree: json['current']['wind_degree']?.toInt() ?? 0,
      windDir: json['current']['wind_dir']?.toString() ?? 'Data not found',
      gustKph: json['current']['gust_kph']?.toDouble() ?? 0.0,
      visKm: json['current']['vis_km']?.toDouble() ?? 0.0,
      presureMb: json['current']['pressure_mb']?.toInt() ?? 0,
      humidity: json['current']['humidity']?.toInt() ?? 0,
      avgTemp: (json['forecast']?['forecastday']?.isNotEmpty == true &&
              json['forecast']?['forecastday']?[0]?['day']?['avgtemp_c'] !=
                  null)
          ? (json['forecast']!['forecastday']![0]['day']['avgtemp_c'] as num)
              .toInt()
          : 0,
      hourTime: (json['forecast']['forecastday'] as List<dynamic>)
          .expand((day) => (day['hour']) as List<dynamic>)
          .map((e) => DateTime.parse(e['time'] as String))
          .toList(),
      hourTemperature: (json['forecast']['forecastday'] as List<dynamic>)
          .expand((day) => (day['hour'] as List<dynamic>))
          .map((e) => (e['temp_c'] as num).toDouble())
          .toList(),
      hourCondition: (json['forecast']['forecastday'] as List<dynamic>)
          .expand((day) => (day['hour'] as List<dynamic>))
          .map((e) => (e['condition']['text'] as String))
          .toList(),
      hourImageUrl: (json['forecast']['forecastday'] as List<dynamic>)
          .expand((day) => (day['hour'] as List<dynamic>))
          .map((e) => ('https:${e['condition']['icon'] as String}'))
          .toList(),
      dailyDate: (json['forecast']['forecastday'] as List<dynamic>)
          .map((e) => (e['date'] as String))
          .toList(),
      dailyMinTemp: (json['forecast']['forecastday'] as List<dynamic>)
          .map((e) => (e['day']['mintemp_c'] as num).toDouble())
          .toList(),
      dailyMaxTemp: (json['forecast']['forecastday'] as List<dynamic>)
          .map((e) => (e['day']['maxtemp_c'] as num).toDouble())
          .toList(),
      dailyCondition: (json['forecast']['forecastday'] as List<dynamic>)
          .map((e) => (e['day']['condition']['text'] as String))
          .toList(),
      dailyImageUrl: (json['forecast']['forecastday'] as List<dynamic>)
          .map((e) => ('https:${e['day']['condition']['icon'] as String}'))
          .toList(),
    );
  }
}

part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAllWeather extends WeatherEvent {
  LoadAllWeather({this.cities, this.completer});

  final List<String>? cities;
  final Completer? completer;

  @override
  List<Object?> get props => [cities, completer];
}

class LoadWeather extends WeatherEvent {
  LoadWeather({required this.city});

  final String city;

  @override
  List<Object?> get props => [city];
}

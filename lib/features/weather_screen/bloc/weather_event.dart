part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWeather extends WeatherEvent {
  LoadWeather({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

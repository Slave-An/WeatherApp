part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  WeatherLoaded({required this.weatherForecast});
  final AllWeatherForecast weatherForecast;

  @override
  List<Object?> get props => [weatherForecast];
}

class WearherLoadingFailure extends WeatherState {
  WearherLoadingFailure({required this.exeption});
  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}

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

class AllWeatherLoaded extends WeatherState {
  AllWeatherLoaded({required this.allWeatherForecast});
  final List<AllWeatherForecast> allWeatherForecast;

  @override
  List<Object?> get props => [allWeatherForecast];
}

class WeatherLoaded extends WeatherState {
  WeatherLoaded({required this.weatherForecast});
  final AllWeatherForecast weatherForecast;

  @override
  List<Object?> get props => [weatherForecast];
}

class WeatherLoadingFailure extends WeatherState {
  WeatherLoadingFailure({required this.exception});
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

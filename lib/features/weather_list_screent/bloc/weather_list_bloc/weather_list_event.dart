part of 'weather_list_bloc.dart';

class WeatherListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAutocomplete extends WeatherListEvent {
  LoadAutocomplete({required this.query});
  final String query;

  @override
  List<Object?> get props => [query];
}

class LoadDataFromHive extends WeatherListEvent {
  @override
  List<Object?> get props => [];
}

class StartSearch extends WeatherListEvent {
  @override
  List<Object?> get props => [];
}

class CancelSearch extends WeatherListEvent {
  @override
  List<Object?> get props => [];
}

class ChangeWeatherList extends WeatherListEvent {
  @override
  List<Object?> get props => [];
}

class AplyChanges extends WeatherListEvent {
  @override
  List<Object?> get props => [];
}

class StartElementAnimation extends WeatherListEvent {
  StartElementAnimation({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class CancelAnimation extends WeatherListEvent {
  CancelAnimation({this.indices});
  final List<int>? indices;
  @override
  List<Object?> get props => [indices ?? []];
}

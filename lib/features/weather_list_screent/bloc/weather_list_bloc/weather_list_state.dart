part of 'weather_list_bloc.dart';

class WeatherListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherListInitial extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class WeatherListLoading extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class AutocompleteLoaded extends WeatherListState {
  AutocompleteLoaded({required this.places});
  final List<Prediction> places;

  @override
  List<Object?> get props => [places];
}

class AutocompleteLoading extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class DataFromHiveLoaded extends WeatherListState {
  DataFromHiveLoaded({required this.cities});
  final List<String> cities;
  @override
  List<Object?> get props => [cities];
}

class SearchInactive extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class SearchActive extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class WeatherListLoadingFailure extends WeatherListState {
  WeatherListLoadingFailure({required this.exception});
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

class ChangeActive extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class ChangeInactive extends WeatherListState {
  @override
  List<Object?> get props => [];
}

class AnimationState extends WeatherListState {
  AnimationState({required this.animations});
  final Map<int, bool> animations;

  @override
  List<Object?> get props => [animations];
}

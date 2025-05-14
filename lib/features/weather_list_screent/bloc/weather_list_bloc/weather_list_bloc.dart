import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:weather_app/repositories/autocomplite_repository/abstract_autocomplete_repository.dart';
import 'package:weather_app/service/hive_service/hive_service.dart';

part 'weather_list_event.dart';
part 'weather_list_state.dart';

class WeatherListBloc extends Bloc<WeatherListEvent, WeatherListState> {
  final AbstractAutocompleteRepository autocompleteRepository;
  final HiveService hiveService;
  WeatherListBloc(this.autocompleteRepository, this.hiveService)
    : super(WeatherListInitial()) {
    on<LoadAutocomplete>((event, emit) async {
      final List<Prediction> cities;

      try {
        if (state is! AutocompleteLoaded) {
          emit(WeatherListLoading());
        }
        if (event.query.isEmpty) {
          return;
        }
        cities = await autocompleteRepository.getAutocomplite(event.query);
        if (cities.isEmpty) {
          emit(
            WeatherListLoadingFailure(
              exception: Exception('No sities avalible'),
            ),
          );
        }
        emit(AutocompleteLoaded(places: cities));
      } catch (e) {
        emit(WeatherListLoadingFailure(exception: Exception(e.toString())));
      }
    });

    on<LoadDataFromHive>((event, emit) {
      try {
        if (state is! DataFromHiveLoaded) {
          emit(WeatherListLoading());
        }
        final List<String> cities = hiveService.getAllCities();
        emit(DataFromHiveLoaded(cities: cities));
      } catch (e) {
        emit(WeatherListLoadingFailure(exception: Exception(e.toString())));
      }
    });

    on<StartSearch>((event, emit) => emit(SearchActive()));

    on<CancelSearch>((event, emit) => emit(SearchInactive()));

    on<ChangeWeatherList>((event, emit) => emit(ChangeActive()));

    on<AplyChanges>((event, emit) => emit(ChangeInactive()));
  }
}

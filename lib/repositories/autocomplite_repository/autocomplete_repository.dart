import 'package:dio/dio.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:weather_app/repositories/autocomplite_repository/abstract_autocomplete_repository.dart';

class AutocompliteRepository implements AbstractAutocompleteRepository {
  AutocompliteRepository({required this.dio, required this.apiKey});

  final Dio dio;
  final String apiKey;

  @override
  Future<List<Prediction>> getAutocomplite(String query) async {
    final goooglePlaces = GoogleMapsPlaces(apiKey: apiKey);

    final PlacesAutocompleteResponse response = await goooglePlaces
        .autocomplete(query, types: ['(regions)']);

    if (response.status == 'OK') {
      return response.predictions;
    } else {
      throw Exception('Error fetching autocomplete data');
    }
  }
}

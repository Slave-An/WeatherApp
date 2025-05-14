import 'package:google_maps_webservice/places.dart';

abstract class AbstractAutocompleteRepository {
  Future<List<Prediction>> getAutocomplite(String query);
}

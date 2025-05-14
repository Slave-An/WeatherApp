import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  void initEnv() {
    _forecastApiUrl = dotenv.env["FORECAST_API_URL"];
    _forecastApiKey = dotenv.env["FORECAST_API_KEY"];
    _autocompliteApiKey = dotenv.env["AUTOCOPLETE_API_KEY"];
  }

  String? _forecastApiUrl;
  String? _forecastApiKey;
  String? _autocompliteApiKey;

  String get forecastApiUrl => _forecastApiUrl ?? '';
  String get forecastApiKey => _forecastApiKey ?? '';
  String get autocompliteApiKey => _autocompliteApiKey ?? '';
}

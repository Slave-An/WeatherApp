import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:weather_app/features/weather_list_screent/widgets/weather_list_app_bar/add_weather_modal_bottom_sheet.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key, required this.cities});

  final List<Prediction> cities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => Divider(),
        itemCount: cities.length,
        itemBuilder:
            (context, index) => ListTile(
              onTap: () async {
                final weatherBloc = context.read<WeatherBloc>();
                final weatherListBloc = context.read<WeatherListBloc>();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,

                  builder: (context) {
                    final String city =
                        '${cities[index].structuredFormatting?.mainText}';
                    final String country =
                        '${cities[index].structuredFormatting?.secondaryText}';
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: weatherBloc),
                        BlocProvider.value(value: weatherListBloc),
                      ],
                      child: AddWeatherModalBottomSheet(
                        city: city,
                        country: country,
                      ),
                    );
                  },
                );
              },
              title: Text(
                "${cities[index].structuredFormatting?.mainText}, ${cities[index].structuredFormatting?.secondaryText}",
                style: TextStyle(color: Colors.white),
              ),
            ),
      ),
    );
  }
}

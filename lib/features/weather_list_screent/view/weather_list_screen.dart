import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather_list_screent/widgets/hive_bloc_builed_widget/weather_list_bloc_builed_widget.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';
import 'package:weather_app/features/weather_screen/bloc/weather_bloc.dart';

@RoutePage()
class WeatherListScreen extends StatefulWidget {
  const WeatherListScreen({super.key});

  @override
  State<WeatherListScreen> createState() => _WeatherListScreenState();
}

class _WeatherListScreenState extends State<WeatherListScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<WeatherListBloc>()),
        BlocProvider(create: (_) => GetIt.I<WeatherBloc>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: WeatherListBlocBuiledWidget(),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_list_screent/bloc/weather_list_bloc/weather_list_bloc.dart';

class SearchCityTextField extends StatefulWidget {
  const SearchCityTextField({super.key});

  @override
  State<SearchCityTextField> createState() => _SearchCityTextFieldState();
}

class _SearchCityTextFieldState extends State<SearchCityTextField> {
  late final TextEditingController _controller;
  Timer? debounce;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onSearchChanged(String query) {
      if (debounce?.isActive ?? false) debounce!.cancel();
      debounce = Timer(const Duration(milliseconds: 300), () {
        context.read<WeatherListBloc>().add(LoadAutocomplete(query: query));
      });
    }

    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          Expanded(
            child: TextField(
              controller: _controller,
              autofocus: true,
              onChanged: onSearchChanged,
              decoration: const InputDecoration(
                hintText: 'Search city or airport',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white54, fontSize: 18),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

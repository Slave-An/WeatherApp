import 'package:flutter/material.dart';

class WeatherListSearchBar extends StatelessWidget {
  const WeatherListSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width - 32,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                Text(
                  'Search city or airport',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

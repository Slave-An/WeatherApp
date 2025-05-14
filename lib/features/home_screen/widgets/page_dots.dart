import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageDots extends StatelessWidget {
  const PageDots({
    super.key,
    required this.controller,
    required this.city,
  });

  final PageController controller;
  final List<String> city;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SmoothPageIndicator(
          controller: controller,
          count: city.length + 1,
          effect: WormEffect(
            dotColor: Colors.white38,
            activeDotColor: Colors.white,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ),
    );
  }
}

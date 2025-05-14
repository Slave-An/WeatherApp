import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.title,
    required this.child,
    required this.width,
    required this.height,
  });

  final Widget title;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(top: 10, right: 12, left: 12),
      decoration: BoxDecoration(
        color: Color(0xFF007BFF),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          Divider(),
          child,
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final Paint paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    for (int i = 0; i <= 60; i++) {
      final angle = (2 * pi / 60) * i - pi / 2;
      final start =
          center + Offset(cos(angle) * radius * 0.8, sin(angle) * radius * 0.8);
      final end = center + Offset(cos(angle) * radius, sin(angle) * radius);
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

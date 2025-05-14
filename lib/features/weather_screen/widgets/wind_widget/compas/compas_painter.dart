import 'dart:math';

import 'package:flutter/material.dart';

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, circlePaint);

    final Paint tickPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    final Paint directionPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4;

    for (int i = 0; i < 360; i++) {
      double angle = i * pi / 180;
      double tickLength = 5.0;

      if (i % 90 == 0) {
        tickLength = 15.0;
      }

      Offset start = center +
          Offset(cos(angle) * (radius - tickLength),
              sin(angle) * (radius - tickLength));
      Offset end = center + Offset(cos(angle) * radius, sin(angle) * radius);

      if (i % 90 == 0) {
        canvas.drawLine(start, end, directionPaint);
      } else {
        canvas.drawLine(start, end, tickPaint);
      }
    }

    final textStyle = TextStyle(color: Colors.white, fontSize: 14);
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    const directions = ['N', 'E', 'S', 'W'];
    for (int i = 0; i < directions.length; i++) {
      double angle = (i * 90) * pi / 180;
      final text = TextSpan(text: directions[i], style: textStyle);
      textPainter.text = text;
      textPainter.layout();

      final offset = center +
          Offset(cos(angle) * (radius - 25), sin(angle) * (radius - 25));

      textPainter.paint(canvas,
          offset - Offset(textPainter.width / 2, textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter {
  final bool hourMode;

  ClockDialPainter({required this.hourMode});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2;

    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius - 10, circlePaint);

    final total = hourMode ? 12 : 60;

    for (int i = 0; i < total; i++) {
      final angle = (2 * pi * i / total) - pi / 2;

      final offset = Offset(
        center.dx + (radius - 30) * cos(angle),

        center.dy + (radius - 30) * sin(angle),
      );

      final text = TextPainter(
        text: TextSpan(
          text: hourMode ? '${i == 0 ? 12 : i}' : '$i',

          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),

        textDirection: TextDirection.ltr,
      );

      text.layout();

      text.paint(canvas, offset - Offset(text.width / 2, text.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant ClockDialPainter oldDelegate) {
    return oldDelegate.hourMode != hourMode;
  }
}

import 'dart:math';
import 'package:flutter/material.dart';

class ClockHandPainter
    extends CustomPainter {

  final double angle;

  ClockHandPainter({
    required this.angle,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {

    final center =
        Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius =
        size.width / 2;

    final handPaint =
        Paint()
          ..strokeWidth = 4
          ..style =
              PaintingStyle.stroke;

    final handEnd =
        Offset(
      center.dx +
          radius *
              0.7 *
              cos(angle),
      center.dy +
          radius *
              0.7 *
              sin(angle),
    );

    canvas.drawLine(
      center,
      handEnd,
      handPaint,
    );

    canvas.drawCircle(
      center,
      8,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(
    covariant
    ClockHandPainter oldDelegate,
  ) {
    return oldDelegate.angle !=
        angle;
  }
}
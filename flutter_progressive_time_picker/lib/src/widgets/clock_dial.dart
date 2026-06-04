import 'dart:math';

import 'package:flutter/material.dart';

import '../models/clock_mode.dart';

class ClockDial extends StatelessWidget {
  final ClockMode mode;

  final ValueChanged<int> onSelected;

  const ClockDial({super.key, required this.mode, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        final box = context.findRenderObject() as RenderBox;

        final local = box.globalToLocal(details.globalPosition);

        final center = Offset(box.size.width / 2, box.size.height / 2);

        final dx = local.dx - center.dx;

        final dy = local.dy - center.dy;

        double angle = atan2(dy, dx);

        angle += pi / 2;

        if (angle < 0) {
          angle += 2 * pi;
        }

        if (mode == ClockMode.hour) {
          int hour = (angle / (2 * pi) * 12).round();

          if (hour == 0) {
            hour = 12;
          }

          onSelected(hour);
        } else {
          final minute = (angle / (2 * pi) * 60).round() % 60;

          onSelected(minute);
        }
      },

      child: SizedBox(
        width: 280,
        height: 280,

        child: CustomPaint(painter: _DialPainter(mode)),
      ),
    );
  }
}

class _DialPainter extends CustomPainter {
  final ClockMode mode;

  _DialPainter(this.mode);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2;

    canvas.drawCircle(
      center,
      radius - 10,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    const minuteValues = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];

    final total = 12;

    for (int i = 0; i < total; i++) {
      final angle = (2 * pi * i / total) - pi / 2;

      final pos = Offset(
        center.dx + (radius - 30) * cos(angle),

        center.dy + (radius - 30) * sin(angle),
      );

      final text = TextPainter(
        text: TextSpan(
          text: mode == ClockMode.hour
              ? '${i == 0 ? 12 : i}'
              : minuteValues[i].toString().padLeft(2, '0'),

          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),

        textDirection: TextDirection.ltr,
      );

      text.layout();

      text.paint(canvas, pos - Offset(text.width / 2, text.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

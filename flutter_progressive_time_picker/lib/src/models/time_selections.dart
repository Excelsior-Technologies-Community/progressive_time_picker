import 'package:flutter/material.dart';

class TimeSelection {

  final int hour;

  final int minute;

  final bool isAm;

  const TimeSelection({
    required this.hour,
    required this.minute,
    required this.isAm,
  });

  TimeOfDay toTimeOfDay() {

    int h = hour;

    if (!isAm && h < 12) {
      h += 12;
    }

    if (isAm && h == 12) {
      h = 0;
    }

    return TimeOfDay(
      hour: h,
      minute: minute,
    );
  }

  TimeSelection copyWith({
    int? hour,
    int? minute,
    bool? isAm,
  }) {
    return TimeSelection(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      isAm: isAm ?? this.isAm,
    );
  }
}
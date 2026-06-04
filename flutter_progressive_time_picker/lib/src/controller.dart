import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progressive_time_picker/src/models/time_selections.dart';

import 'models/clock_mode.dart';

class ClockTimeController extends ChangeNotifier {
  ClockMode mode = ClockMode.hour;

  TimeSelection selection;

  final bool enableHapticFeedback;

  ClockTimeController({
    required this.selection,
    this.enableHapticFeedback = true,
  });

  void selectHour(int hour) {
    selection = selection.copyWith(hour: hour);

    mode = ClockMode.minute;

    _haptic();

    notifyListeners();
  }

  void selectMinute(int minute) {
    selection = selection.copyWith(minute: minute);

    _haptic();

    notifyListeners();
  }

  void setAm(bool value) {
    selection = selection.copyWith(isAm: value);

    notifyListeners();
  }

  void showHourMode() {
    mode = ClockMode.hour;

    notifyListeners();
  }

  void showMinuteMode() {
    mode = ClockMode.minute;

    notifyListeners();
  }

  void setCurrentTime() {
    final now = TimeOfDay.now();

    selection = TimeSelection(
      hour: now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod,
      minute: now.minute,
      isAm: now.period == DayPeriod.am,
    );

    notifyListeners();
  }

  void _haptic() {
    if (enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }
}

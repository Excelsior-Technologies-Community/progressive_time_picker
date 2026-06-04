import 'package:flutter/material.dart';

import 'controller.dart';
import 'models/clock_mode.dart';

import 'widgets/am_pm_toggle.dart';
import 'widgets/clock_dial.dart';
import 'widgets/digital_time_display.dart';

class ClockTimeDialog extends StatelessWidget {
  final ClockTimeController controller;

  const ClockTimeDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: AnimatedBuilder(
        animation: controller,

        builder: (_, __) {
          return Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              DigitalTimeDisplay(
                selection: controller.selection,

                onHourTap: () {
                  controller.showHourMode();
                },

                onMinuteTap: () {
                  controller.showMinuteMode();
                },
              ),

              const SizedBox(height: 20),

              ClockDial(
                mode: controller.mode,

                onSelected: (value) {
                  if (controller.mode == ClockMode.hour) {
                    controller.selectHour(value);
                  } else {
                    controller.selectMinute(value);
                  }
                },
              ),

              const SizedBox(height: 20),

              AmPmToggle(
                isAm: controller.selection.isAm,

                onChanged: controller.setAm,
              ),
            ],
          );
        },
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, controller.selection.toTimeOfDay());
          },
          child: const Text('Select'),
        ),
      ],
    );
  }
}

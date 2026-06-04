import 'package:flutter/material.dart';

import 'clock_time_dialog.dart';
import 'controller.dart';

import 'models/time_selections.dart';

class ClockTimePicker extends StatefulWidget {
  final String buttonText;

  final TimeOfDay initialTime;

  final ValueChanged<TimeOfDay>? onTimeSelected;

  const ClockTimePicker({
    super.key,
    this.buttonText = 'Pick Time',
    required this.initialTime,
    this.onTimeSelected,
  });

  @override
  State<ClockTimePicker> createState() => _ClockTimePickerState();
}

class _ClockTimePickerState extends State<ClockTimePicker> {
  late ClockTimeController controller;

  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();

    selectedTime = widget.initialTime;

    controller = ClockTimeController(
      selection: TimeSelection(
        hour: widget.initialTime.hourOfPeriod == 0
            ? 12
            : widget.initialTime.hourOfPeriod,

        minute: widget.initialTime.minute,

        isAm: widget.initialTime.period == DayPeriod.am,
      ),
    );
  }

  Future<void> _openPicker() async {
    final result = await showDialog<TimeOfDay>(
      context: context,

      builder: (_) => ClockTimeDialog(controller: controller),
    );

    if (result != null) {
      setState(() {
        selectedTime = result;
      });

      widget.onTimeSelected?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text(
          selectedTime!.format(context),

          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        ElevatedButton(onPressed: _openPicker, child: Text(widget.buttonText)),
      ],
    );
  }
}

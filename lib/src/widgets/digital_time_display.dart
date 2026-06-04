import 'package:flutter/material.dart';
import 'package:flutter_progressive_time_picker/src/models/time_selections.dart';

class DigitalTimeDisplay extends StatelessWidget {
  final TimeSelection selection;

  final VoidCallback onHourTap;

  final VoidCallback onMinuteTap;

  const DigitalTimeDisplay({
    super.key,
    required this.selection,
    required this.onHourTap,
    required this.onMinuteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        InkWell(
          onTap: onHourTap,

          child: Text(
            selection.hour.toString().padLeft(2, '0'),

            style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ),

        const Text(
          ' : ',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),

        InkWell(
          onTap: onMinuteTap,

          child: Text(
            selection.minute.toString().padLeft(2, '0'),

            style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

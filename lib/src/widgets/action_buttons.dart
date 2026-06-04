import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCurrentTime;

  final VoidCallback onConfirm;

  final VoidCallback? onCancel;

  const ActionButtons({
    super.key,
    required this.onCurrentTime,
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,

      children: [
        OutlinedButton(onPressed: onCurrentTime, child: const Text('Now')),

        if (onCancel != null)
          OutlinedButton(onPressed: onCancel, child: const Text('Cancel')),

        ElevatedButton(onPressed: onConfirm, child: const Text('OK')),
      ],
    );
  }
}

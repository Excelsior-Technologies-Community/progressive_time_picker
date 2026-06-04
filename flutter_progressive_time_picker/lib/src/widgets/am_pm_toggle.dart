import 'package:flutter/material.dart';

class AmPmToggle extends StatelessWidget {
  final bool isAm;

  final ValueChanged<bool> onChanged;

  const AmPmToggle({super.key, required this.isAm, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        border: Border.all(),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          ChoiceChip(
            label: const Text('AM'),

            selected: isAm,

            onSelected: (_) {
              onChanged(true);
            },
          ),

          ChoiceChip(
            label: const Text('PM'),

            selected: !isAm,

            onSelected: (_) {
              onChanged(false);
            },
          ),
        ],
      ),
    );
  }
}

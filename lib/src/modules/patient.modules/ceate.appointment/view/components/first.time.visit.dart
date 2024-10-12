import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FirstTimeVisit extends StatelessWidget {
  const FirstTimeVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CheckboxListTile.adaptive(
              value: true,
              onChanged: (v) {},
              title: const Text('I am visiting the first time'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: context.theme.colorScheme.error,
                ),
                const Text(
                  'Please bring your prescription for better treatment',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

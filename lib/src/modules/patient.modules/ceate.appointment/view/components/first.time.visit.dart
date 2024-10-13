import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/providers/new.appointment.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstTimeVisit extends ConsumerWidget {
  const FirstTimeVisit({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isFirstVisit =
        ref.watch(newAppointmentProvider.select((v) => v.isFirstTime!));

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              value: isFirstVisit,
              onChanged: (v) =>
                  ref.read(newAppointmentProvider.notifier).setFirstTime = v!,
              title: const Text('I am visiting the first time'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (!isFirstVisit)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  5.toWidth,
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

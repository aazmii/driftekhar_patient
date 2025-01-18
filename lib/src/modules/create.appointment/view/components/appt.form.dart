import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:driftekhar_patient/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gender.picker.dart';
import 'visit.type.picker.dart';

final apptFormKey = GlobalKey<FormState>();

class AppointmentForm extends ConsumerWidget {
  const AppointmentForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final patientNotifier = ref.watch(patientProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Form(
        key: apptFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 10.toHeight,
            const TextWithAstrics('Phone Number'),
            TextFormField(
              onChanged: (phone) => patientNotifier.setPhone = phone,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: Validators.validatePhoneNumber,
              decoration: const InputDecoration(
                prefix: Text('+88'),
              ),
            ),
            10.toHeight,
            const TextWithAstrics('Patient Name'),
            TextFormField(
              validator: Validators.nonEmpty,
              onChanged: (name) => patientNotifier.setName = name,
            ),
            10.toHeight,
            const TextWithAstrics('Age'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (age) =>
                        patientNotifier.setAge = int.tryParse(age),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: Validators.nonEmpty,
                  ),
                ),
                5.toWidth,
                const Text('Y/O'),
              ],
            ),
            10.toHeight,
            const TextWithAstrics('Gender'),
            const GenderPicker(),
            10.toHeight,
            const TextWithAstrics('Type'),
            const VisitTypePicker(),
            10.toHeight,
            const Text('Note (optional)'),
            TextField(
              decoration:
                  const InputDecoration(contentPadding: EdgeInsets.all(8)),
              onChanged: (note) => patientNotifier.setNote = note,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class TextWithAstrics extends StatelessWidget {
  const TextWithAstrics(this.label, {super.key});
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          const SizedBox(width: 5),
          Text(label ?? ''),
        ],
        const Text(
          '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

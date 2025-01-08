import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gender.picker.dart';
import 'visit.type.picker.dart';

class AppointmentForm extends ConsumerWidget {
  const AppointmentForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final patientNotifier = ref.watch(patientProvider.notifier);
    // final apptNotifier = ref.watch(newAppointmentProvider.notifier);
    // final selectedDt =
    //     ref.watch(newAppointmentProvider.select((v) => v.dateTime));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 10.toHeight,
          const TextWithAstrics('Phone Number'),
          TextField(
            onChanged: (phone) => patientNotifier.setPhone = phone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              prefix: Text('+88'),
              // hintText: 'Phone Number',
              // label: TextWithAstrics('Phone Number'),
            ),
          ),
          10.toHeight,
          const TextWithAstrics('Patient Name'),
          TextField(
            onChanged: (name) => patientNotifier.setName = name,
          ),
          10.toHeight,
          const TextWithAstrics('Age'),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (age) =>
                      patientNotifier.setAge = int.tryParse(age),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
        ],
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

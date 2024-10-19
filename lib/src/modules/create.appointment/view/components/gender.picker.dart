import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderPicker extends ConsumerWidget {
  const GenderPicker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final patientNotifier = ref.watch(patientProvider.notifier);
    final selectedGender = ref.watch(patientProvider.select((v) => v.gender));
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'Phone Number'),
          ),
        ),
        Flexible(
          child: RadioListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: const Text('Male'),
            value: Gender.male,
            groupValue: selectedGender,
            onChanged: (v) => patientNotifier.setGender = v!,
          ),
        ),
        Flexible(
          child: RadioListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: const Text('Female'),
            value: Gender.female,
            groupValue: selectedGender,
            onChanged: (v) => patientNotifier.setGender = v!,
          ),
        ),
      ],
    );
  }
}

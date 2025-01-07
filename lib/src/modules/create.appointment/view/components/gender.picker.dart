import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderPicker extends ConsumerWidget {
  const GenderPicker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      width: context.isTabletWidth ? context.width * 0.4 : context.width,
      child: SegmentedButton<Gender>(
        showSelectedIcon: false,
        style: ButtonStyle(
          padding:
              WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
            if (state.contains(WidgetState.selected)) {
              return context.theme.primaryColor;
            }
            return Colors.white;
          }),
          foregroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
            if (state.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return context.theme.primaryColor;
          }),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        segments: const [
          ButtonSegment<Gender>(
            value: Gender.male,
            label: Text('Male'),
            // icon: const Icon(Icons.male),
          ),
          ButtonSegment<Gender>(
            value: Gender.female,
            label: Text('Female'),
            // icon: const Icon(Icons.female),
          ),
          ButtonSegment<Gender>(
            value: Gender.other,
            label: Text('Other'),
            // icon: const Icon(Icons.other_houses),
          ),
        ],
        selected: {ref.watch(patientProvider).gender ?? Gender.male},
        onSelectionChanged: (value) {
          ref.read(patientProvider.notifier).setGender = value.first;
        },
      ),
    );
  }
}

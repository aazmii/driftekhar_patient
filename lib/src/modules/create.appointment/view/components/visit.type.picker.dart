import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitTypePicker extends ConsumerWidget {
  const VisitTypePicker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newAppt = ref.watch(newAppointmentProvider);
    // const types = AppointmentType.values;

    return SizedBox(
      width: context.isTabletWidth ? context.width * 0.4 : context.width,
      child: SegmentedButton<AppointmentType>(
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
          ButtonSegment<AppointmentType>(
            value: AppointmentType.firstTime,
            label: Text('New'),
            // icon: const Icon(Icons.male),
          ),
          ButtonSegment<AppointmentType>(
            value: AppointmentType.followUp,
            label: Text('Follow-Up'),
            // icon: const Icon(Icons.female),
          ),
          ButtonSegment<AppointmentType>(
            value: AppointmentType.report,
            label: Text('Report'),
            // icon: const Icon(Icons.other_houses),
          ),
        ],
        selected: {newAppt.type!},
        onSelectionChanged: (type) => ref
            .read(newAppointmentProvider.notifier)
            .update(newAppt.copyWith(type: type.first)),
        // onSelectionChanged: (type) => ref
        //     .read(newAppointmentProvider.notifier)
        //     .update(newAppt.copyWith(type: type.first)),
      ),
    );
  }
}

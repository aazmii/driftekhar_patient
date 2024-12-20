import 'package:com.codeconnect.driftekhar.patient/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitTypePicker extends ConsumerWidget {
  const VisitTypePicker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newAppt = ref.watch(newAppointmentProvider);
    const types = AppointmentType.values;

    return DropdownButtonFormField<AppointmentType>(
      value: newAppt.type,
      hint: const Text("Type"),
      onChanged: (AppointmentType? type) => ref
          .read(newAppointmentProvider.notifier)
          .update(newAppt.copyWith(type: type)),
      items:
          types.map<DropdownMenuItem<AppointmentType>>((AppointmentType value) {
        return DropdownMenuItem<AppointmentType>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}
// class VisitTypePicker extends StatefulWidget {
//   const VisitTypePicker({super.key});

//   @override
//   State<VisitTypePicker> createState() => _VisitTypePickerState();
// }

// class _VisitTypePickerState extends State<VisitTypePicker> {
//   // final List<String> types = ['Type', 'New', 'Report', 'Follow Up'];
//   final types = AppointmentType.values;
//   AppointmentType? selectedType;
//   @override
//   Widget build(BuildContext context) {
//     // final isFirstVisit =
//     //     ref.watch(newAppointmentProvider.select((v) => v.isFirstTime!));

//     return DropdownButtonFormField<AppointmentType>(
//       value: selectedType,
//       hint: const Text("Type"),
//       onChanged: (AppointmentType? type) {
//         setState(() {
//           selectedType = type;
//         });
//       },
//       items:
//           types.map<DropdownMenuItem<AppointmentType>>((AppointmentType value) {
//         return DropdownMenuItem<AppointmentType>(
//           value: value,
//           child: Text(value.name),
//         );
//       }).toList(),
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//       ),
//     );
//   }
// }

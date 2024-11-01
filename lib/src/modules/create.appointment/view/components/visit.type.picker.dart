import 'package:flutter/material.dart';

class VisitTypePicker extends StatefulWidget {
  const VisitTypePicker({super.key});

  @override
  State<VisitTypePicker> createState() => _VisitTypePickerState();
}

class _VisitTypePickerState extends State<VisitTypePicker> {
  final List<String> types = ['Type', 'New', 'Report', 'Follow Up'];
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    // final isFirstVisit =
    //     ref.watch(newAppointmentProvider.select((v) => v.isFirstTime!));

    return DropdownButtonFormField<String>(
      value: selectedType,
      hint: const Text("Type"),
      onChanged: (String? newValue) {
        setState(() {
          selectedType = newValue;
        });
      },
      items: types.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}
// class VisitTypePicker extends ConsumerWidget {
//   const VisitTypePicker({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     final isFirstVisit =
//         ref.watch(newAppointmentProvider.select((v) => v.isFirstTime!));

//     return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CheckboxListTile.adaptive(
//               tileColor: Colors.transparent,
//               contentPadding: EdgeInsets.zero,
//               value: isFirstVisit,
//               onChanged: (v) =>
//                   ref.read(newAppointmentProvider.notifier).setFirstTime = v!,
//               title: const Text('I am visiting the first time'),
//               controlAffinity: ListTileControlAffinity.leading,
//             ),
//             if (!isFirstVisit)
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   5.toWidth,
//                   Icon(
//                     Icons.warning_amber_rounded,
//                     color: context.theme.colorScheme.error,
//                   ),
//                   const Text(
//                     'Please bring your prescription for better treatment',
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

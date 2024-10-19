import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChemberDropdown extends ConsumerWidget {
  const ChemberDropdown({
    super.key,
    this.onChemberSelected,
    required this.appointment,
  });
  final Appointment appointment;

  final ValueSetter<Chember?>? onChemberSelected;

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: 60,
      child: DropdownButton<Chember>(
        value: appointment.chember,
        hint: const Text('Chember'),
        isExpanded: true,
        items: chembers.map((Chember value) {
          return DropdownMenuItem<Chember>(
            value: value,
            child: Text(value.name ?? ''),
          );
        }).toList(),
        onChanged: (chember) => onChemberSelected?.call(chember),
      ),
    );
  }
}

import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/chembers/providers/selected.chember.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleViewTable extends ConsumerWidget {
  const ScheduleViewTable({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final schedules = ref.watch(selectedChemberProvider)?.schedules ?? [];
    final filtered =
        schedules.where((s) => s.slots != null && s.slots!.isNotEmpty).toList();

    // print(schedules);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Schedule', style: context.text.titleMedium),
          10.toHeight,
          Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: const {
              0: FixedColumnWidth(100.0),
              1: FlexColumnWidth(),
            },
            children: filtered.map((e) => buildTableRow(e)).toList(),
          ),
        ],
      ),
    );
  }
}

TableRow buildTableRow(Schedule scedule) {
  final startTime = scedule.slots?.first.start.to12Hour;
  final endTime = scedule.slots?.first.end.to12Hour;
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          scedule.day.name.capitalize,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$startTime - $endTime'),
      ),
    ],
  );
}

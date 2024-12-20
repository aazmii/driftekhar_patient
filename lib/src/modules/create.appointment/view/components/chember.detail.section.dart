import 'package:com.codeconnect.driftekhar.patient/src/extensions/extensions.dart';
import 'package:com.codeconnect.driftekhar.patient/src/modules/chembers/providers/selected.chember.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'schedule.table.dart';

class ChemberDetailSection extends StatelessWidget {
  const ChemberDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return context.width > 600
        ? const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ChemberInformation(),
              ),
              SizedBox(width: 10),
              Expanded(child: ScheduleViewTable()),
            ],
          )
        : const Column(
            children: [
              _ChemberInformation(),
              ScheduleViewTable(),
            ],
          );
  }
}

class _ChemberInformation extends ConsumerWidget {
  const _ChemberInformation();

  @override
  Widget build(BuildContext context, ref) {
    final chember = ref.watch(selectedChemberProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chember Information', style: context.text.titleMedium),
          10.toHeight,
          Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: const {
              0: FixedColumnWidth(100.0), // Width for first column (titles)
              1: FlexColumnWidth(), // Width for second column (fills remaining space)
            },
            children: [
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Address',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(chember?.address ?? ''),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Room',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${chember?.roomNo ?? '-'}'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Address',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(chember?.address ?? ''),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${chember?.phone ?? '-'}'),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Fee',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('BDT 700'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

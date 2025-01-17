import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'pending.card.dart';

final ScrollController _approvedController = ScrollController();

class PendingApptList extends StatelessWidget {
  const PendingApptList({super.key, required this.appts});
  final List<Appointment> appts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pending Appointments', style: context.text.titleLarge),
          5.toHeight,
          const Text(
            'Soon you willreceieve an SMS form docotor',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 8,
                radius: const Radius.circular(8),
                controller: _approvedController,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ListView(
                    controller: _approvedController,
                    children:
                        appts.map((appt) => PendingCard(appt: appt)).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

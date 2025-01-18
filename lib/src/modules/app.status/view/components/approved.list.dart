import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'approved.card.dart';

final ScrollController _approvedController = ScrollController();

class ApprovedAppts extends StatelessWidget {
  const ApprovedAppts({super.key, required this.appts});
  final List<Appointment> appts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Approved (${appts.length})', style: context.text.titleLarge),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Scrollbar(
                controller: _approvedController,
                thumbVisibility: true,
                thickness: 8,
                radius: const Radius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ListView(
                    controller: _approvedController,
                    children:
                        appts.map((appt) => ApprovedCard(appt: appt)).toList(),
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

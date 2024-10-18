import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/appointments/providers/new.appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/appointment.card.dart';

class PendingAppointments extends ConsumerWidget {
  const PendingAppointments({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pendings = ref.watch(pendingAppointmentsProvider).when(
        data: (pendingAppointments) => pendingAppointments,
        error: (e, s) => <Appointment>[],
        loading: () => <Appointment>[]);
    final newAppointments =
        pendings.where((a) => a.isFirstTime ?? false).toList();
    final followUps = pendings.where((a) => !a.isFirstTime!).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.toHeight,
          Text(
            'New Appointments: ${newAppointments.length}',
            style: context.text.titleMedium,
          ),
          Text(
            'Follow Up: ${followUps.length} ',
            style: context.text.titleMedium,
          ),
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AppointmentCard(
                  appointment: pendings[index],
                  onApprove: (a) {},
                ),
              ),
              itemCount: pendings.length,
            ),
          ),
        ],
      ),
    );
  }
}

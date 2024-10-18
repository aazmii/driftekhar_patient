import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/appointments/providers/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/appointment.card.dart';

class PendingAppointments extends ConsumerWidget {
  const PendingAppointments({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pendings = ref
        .watch(appointmentsProvider)
        .when(
            data: (pendingAppointments) => pendingAppointments,
            error: (e, s) => <Appointment>[],
            loading: () => <Appointment>[])
        .where((a) => a.status == AppointmentStatus.pending)
        .toList();

    final newAppointments =
        pendings.where((a) => a.isFirstTime ?? false).toList();
    final followUps = pendings.where((a) => !a.isFirstTime!).toList();

    if (pendings.isEmpty) {
      return Center(
        child: Text(
          'No Pending Appointments',
          style: context.text.titleMedium!.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
      );
    }
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
                  onApprove: () {
                    ref.read(appointmentsProvider.notifier).updateAppointment(
                        index,
                        pendings[index]
                            .copyWith(status: AppointmentStatus.confirmed));
                  },
                  onDateSelected: (pickedDate) {
                    ref.read(appointmentsProvider.notifier).updateAppointment(
                        index, pendings[index].copyWith(dateTime: pickedDate));
                  },
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

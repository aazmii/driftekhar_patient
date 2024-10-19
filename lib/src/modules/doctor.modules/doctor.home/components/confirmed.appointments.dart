import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'appointment.card.dart';

class ConfirmedAppointments extends ConsumerWidget {
  const ConfirmedAppointments({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final confirmed = ref
        .watch(appointmentsProvider)
        .when(
            data: (pendingAppointments) => pendingAppointments,
            error: (e, s) => <Appointment>[],
            loading: () => <Appointment>[])
        .where((a) => a.status == AppointmentStatus.confirmed)
        .toList();
    if (confirmed.isEmpty) {
      return Center(
        child: Text(
          'No Confirmed Appointments',
          style: context.text.titleMedium!.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppointmentCard(
            appointment: confirmed[index],
            onReschedule: (updatedDateTime) {
              ref.read(appointmentsProvider.notifier).updateAppointment(
                  index, confirmed[index].copyWith(dateTime: updatedDateTime));
            },
            onReject: () => ref
                .read(appointmentsProvider.notifier)
                .removeAppointment(index),
          ),
        ),
        itemCount: confirmed.length,
      ),
    );
  }
}

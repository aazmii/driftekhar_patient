import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/appointments.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'appointment.card/appointment.card.dart';

class PendingAppointments extends ConsumerWidget {
  const PendingAppointments({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(appointmentsProvider.notifier);

    final pendings = ref
        .watch(appointmentsProvider)
        .when(
            data: (pendingAppointments) => pendingAppointments,
            error: (e, s) => <Appointment>[],
            loading: () => <Appointment>[])
        .where((a) => a.status == AppointmentStatus.pending)
        .toList();

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
      child: ListView.builder(
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: AppointmentCard(
            key: ValueKey(pendings[index].id),
            appointment: pendings[index],
            onApprove: () {
              notifier.updateAppointment(
                pendings[index].copyWith(status: AppointmentStatus.confirmed),
              );
            },
            onDateSelected: (pickedDate) {
              notifier.updateAppointment(
                pendings[index].copyWith(dateTime: pickedDate),
              );
            },
            onChemberSelected: (chember) {
              notifier.updateAppointment(
                pendings[index].copyWith(chember: chember),
              );
            },
            onReject: () => notifier.removeAppointment(index),
          ),
        ),
        itemCount: pendings.length,
      ),
    );
  }
}

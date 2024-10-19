import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/appointments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'appointment.card.dart';

class PendingAppointments extends ConsumerWidget {
  const PendingAppointments({
    super.key,
    required this.pendings,
    this.newAppointments,
    this.followUps,
  });
  final List<Appointment>? pendings;
  final List<Appointment>? newAppointments;
  final List<Appointment>? followUps;

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(appointmentsProvider.notifier);

    // final notifier = ref.watch(appointmentsProvider.notifier);
    // final pendings = ref
    //     .watch(appointmentsProvider)
    //     .when(
    //         data: (pendingAppointments) => pendingAppointments,
    //         error: (e, s) => <Appointment>[],
    //         loading: () => <Appointment>[])
    //     .where((a) => a.status == AppointmentStatus.pending)
    //     .toList();

    // final newAppointments =
    //     pendings.where((a) => a.isFirstTime ?? false).toList();
    // final followUps = pendings.where((a) => !a.isFirstTime!).toList();

    if (pendings == null || pendings!.isEmpty) {
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
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: AppointmentCard(
                    appointment: pendings![index],
                    onApprove: () {
                      notifier.updateAppointment(
                        index,
                        pendings![index]
                            .copyWith(status: AppointmentStatus.confirmed),
                      );
                    },
                    onDateSelected: (pickedDate) {
                      notifier.updateAppointment(
                        index,
                        pendings![index].copyWith(dateTime: pickedDate),
                      );
                    },
                    onReject: () => notifier.removeAppointment(index)),
              ),
              itemCount: pendings!.length,
            ),
          ),
        ],
      ),
    );
  }
}

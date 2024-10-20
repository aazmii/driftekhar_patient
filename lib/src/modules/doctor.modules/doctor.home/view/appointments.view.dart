import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/appointments.dart';
import 'package:doc_appointment/src/modules/doctor.modules/home/components/easy.date.picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/confirmed.appointments.dart';
import '../components/pending.appoints.dart';

class DoctorHome extends ConsumerWidget {
  const DoctorHome({super.key});

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
    final confirms = ref
        .watch(appointmentsProvider)
        .when(
            data: (pendingAppointments) => pendingAppointments,
            error: (e, s) => <Appointment>[],
            loading: () => <Appointment>[])
        .where((a) => a.status == AppointmentStatus.confirmed)
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! better not delete
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Text(
            //     'Appointments',
            //     style: context.text.titleLarge!.copyWith(
            //       color: context.theme.primaryColor,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // 10.toHeight,
            const EasyDatePicker(),
            10.toHeight,

            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      unselectedLabelStyle: context.text.titleSmall!,
                      labelStyle: context.text.titleMedium!.copyWith(
                        color: context.theme.primaryColor,
                      ),
                      tabs: [
                        Tab(
                          text: 'Pendings (${pendings.length})',
                        ),
                        Tab(text: 'Confirmed (${confirms.length})'),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          PendingAppointments(),
                          ConfirmedAppointments(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

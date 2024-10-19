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

    final newAppointments =
        pendings.where((a) => a.isFirstTime ?? false).toList();
    final followUps = pendings.where((a) => !a.isFirstTime!).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            10.toHeight,
            const EasyDatePicker(),
            10.toHeight,
            Row(
              children: [
                10.toWidth,
                CircleAvatar(
                  radius: 6,
                  backgroundColor: context.theme.primaryColor,
                ),
                5.toWidth,
                Text(
                  'New: ${newAppointments.length}',
                  style: context.text.titleMedium,
                ),
                20.toWidth,
                CircleAvatar(
                  radius: 6,
                  backgroundColor: context.theme.primaryColor,
                ),
                5.toWidth,
                Text(
                  'Follow Up: ${followUps.length}',
                  style: context.text.titleMedium,
                ),
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'Pendings'),
                        Tab(text: 'Confirmed '),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PendingAppointments(
                            pendings: pendings,
                            followUps: followUps,
                          ),
                          const ConfirmedAppointments(),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

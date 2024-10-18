import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/confirmed.appointments.dart';
import '../components/pending.appoints.dart';

class AppointmentView extends ConsumerWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Pendings'),
              Tab(text: 'Confirmed '),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                PendingAppointments(),
                ConfirmedAppointments(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/app.status/provider/user.appts.provider.dart';
import 'package:driftekhar_patient/src/shared.widgets/loading.widget.dart';
import 'package:driftekhar_patient/src/shared.widgets/no.connection.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/approved.list.dart';
import 'components/empty.appt.widget.dart';
import 'components/pendings.list.dart';

class UserApptsView extends ConsumerWidget {
  const UserApptsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final hasValue = ref.watch(userApptsProvider).value != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        actions: [
          IconButton(
            onPressed: () => ref.read(userApptsProvider.notifier).refresh(),
            icon: Icon(
              Icons.refresh,
              // color: Colors.red,
              color: context.theme.primaryColor,
            ),
          )
        ],
      ),
      body: ref.watch(userApptsProvider).when(
            data: (appts) {
              if (appts.isEmpty) return const EmptyApptWidget();
              final pendings = appts
                  .where((a) => a.status == AppointmentStatus.pending)
                  .toList();
              final approved = appts
                  .where((a) => a.status == AppointmentStatus.confirmed)
                  .toList();

              return Column(
                children: [
                  if (approved.isNotEmpty)
                    Expanded(child: ApprovedAppts(appts: approved)),
                  if (pendings.isNotEmpty)
                    Expanded(child: PendingApptList(appts: pendings))
                ],
              );
            },
            error: (error, stackTrace) {
              log(error.toString(), name: 'error getting appoitnments');
              return Center(
                child: error.toString().contains('unavailable')
                    ? const NoConnectionWidget()
                    : const EmptyApptWidget(),
                //UnknownErrorWidget()
              );
            },
            loading: () => const Center(child: LoaderWidget()),
          ),
    );
  }
}

import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/chembers/providers/chembers.provider.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/chember.card.dart';

class ChembersView extends ConsumerWidget {
  const ChembersView({super.key, this.onSelectChember});
  final ValueSetter<Chember>? onSelectChember;

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newAppointmentProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Chembers')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // crossAxisAlignment: CrossAxisAlignment.start,

            ref.watch(chembersProvider).when(
                  data: (chembers) {
                    if (chembers.isEmpty) {
                      return const Center(
                        child: Text('No chember found'),
                      );
                    }
                    return ListView(
                      children: chembers.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: () => onSelectChember?.call(e),
                            child: ChemberCard(
                              chember: e,
                              onPressed: () => notifier.setChember = e,
                            ),
                            // child: ChemberContainer(chember: e),
                          ),
                        );
                      }).toList(),
                    );
                  },
                  error: (e, s) {
                    return const Center(
                      child: Text(
                          'Could not get chember data to make appointment'),
                    );
                  },
                  loading: () => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        10.toWidth,
                        const Text('Getting chember data ..')
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

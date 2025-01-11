import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/chembers/providers/chembers.provider.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/chember.card.dart';

class ChemberSelectionView extends ConsumerWidget {
  const ChemberSelectionView({super.key});
  // final ValueSetter<Chember>? onSelectChember;

  @override
  Widget build(BuildContext context, ref) {
    // print('this');
    // return Scaffold();
    final selectedChember =
        ref.watch(newAppointmentProvider.select((v) => v.chember));
    final notifier = ref.watch(newAppointmentProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
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
                    return ListView(children: [
                      Text(
                        '*Select a chember to book appointment',
                        style: context.text.titleMedium!
                            .copyWith(color: context.theme.primaryColor),
                      ),
                      ...chembers.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ChemberCard(
                            chember: e,
                            isSelected: e.name == selectedChember?.name,
                            onPressed: () => notifier.setChember = e,
                          ),
                        );
                      }),
                    ]);
                  },
                  error: (e, s) {
                    return const Center(
                      child: Text(
                          'Could not get chember data to make appointment'),
                    );
                    // log('error getting chemnber data $e');
                    // return const NoChemberWidget();
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

            ElevatedButton.icon(
              iconAlignment: IconAlignment.end,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight((60)),
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
              ),
              onPressed: selectedChember == null
                  ? null
                  : () => Navigator.pushNamed(context, bookAppointmentRoute),
              label: const Text('Book Schedule'),
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoChemberWidget extends StatelessWidget {
  const NoChemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Can not book appointment', style: context.text.titleLarge),
          // Text('We have an issue with chember', style: context.text.titleLarge),
          Text('Please try again later', style: context.text.bodyLarge),
        ],
      ),
    );
  }
}

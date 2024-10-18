import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/doctor.modules/appointments/providers/appointments.dart';
import 'package:doc_appointment/src/modules/patient.modules/create.appointment/providers/patient.provider.dart';
import 'package:doc_appointment/src/modules/patient.modules/create.appointment/view/components/first.time.visit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAppointment extends ConsumerWidget {
  const CreateAppointment({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(appointmentsProvider);
    final patientNotifier = ref.watch(patientProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 20.toHeight,
                // const DatePickerRow(),
                10.toHeight,
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          label: Text('Patient Name'),
                        ),
                        onChanged: (name) => patientNotifier.setName = name,
                      ),
                    ),
                    10.toWidth,
                    Expanded(
                      child: TextField(
                        onChanged: (age) =>
                            patientNotifier.setAge = int.parse(age),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Age'),
                        ),
                      ),
                    ),
                    5.toWidth,
                    const Text('Y/O'),
                  ],
                ),
                10.toHeight,
                TextField(
                  onChanged: (phone) => patientNotifier.setPhone = phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefix: Text('+880'),
                    // hintText: 'Phone Number',
                    label: Text('Phone Number'),
                  ),
                ),
                Text(
                  '* You will be notified thruogh sms/email once your appointment is confirmed.',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                // const NotifyMethodContainer(),
                10.toHeight,
                const FirstTimeVisit(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

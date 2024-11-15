import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/view/components/gender.picker.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/view/components/visit.type.picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentForm extends ConsumerWidget {
  const AppointmentForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final patientNotifier = ref.watch(patientProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 20.toHeight,
          // const DatePickerR  ow(),

          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('* Patient Name'),
                  ),
                  onChanged: (name) => patientNotifier.setName = name,
                ),
              ),
              10.toWidth,
              Expanded(
                child: TextField(
                  onChanged: (age) => patientNotifier.setAge = int.parse(age),
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
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  onChanged: (phone) => patientNotifier.setPhone = phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefix: Text('+880'),
                    // hintText: 'Phone Number',
                    label: Text('* Phone Number'),
                  ),
                ),
              ),
              10.toWidth,
              const Flexible(child: GenderPicker()),
            ],
          ),
          Text(
            '* You will be notified thruogh sms once your appointment is confirmed.',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          // const NotifyMethodContainer(),

          5.toHeight,
          const VisitTypePicker(),
        ],
      ),
    );
  }
}

import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/providers/new.appointment.provider.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/providers/patient.provider.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/view/components/first.time.visit.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/appt.date.picker.dart';
import 'components/custom.bottom.bar.dart';
import 'components/notify.method.dart';

class CreateAppointment extends ConsumerWidget {
  const CreateAppointment({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final patientNotifier = ref.watch(patientProvider.notifier);
    final selectedGender = ref.watch(patientProvider.select((v) => v.gender));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DatePicker(),
                  10.toHeight,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Patient Name',
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
                            hintText: 'Patient Age',
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
                      const Expanded(
                        flex: 2,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: 'Phone Number'),
                        ),
                      ),
                      Flexible(
                        child: RadioListTile.adaptive(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: const Text('Male'),
                          value: Gender.male,
                          groupValue: selectedGender,
                          onChanged: (v) => patientNotifier.setGender = v!,
                        ),
                      ),
                      Flexible(
                        child: RadioListTile.adaptive(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: const Text('Female'),
                          value: Gender.female,
                          groupValue: selectedGender,
                          onChanged: (v) => patientNotifier.setGender = v!,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '* You will be notified thruogh sms/email once your appointment is confirmed.',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  const NotifyMethodContainer(),
                  10.toHeight,
                  const Text('Select one of the chember'),
                  const ChemberSelector(),
                  10.toHeight,
                  const FirstTimeVisit(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}

class ChemberSelector extends ConsumerWidget {
  const ChemberSelector({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedChember =
        ref.watch(newAppointmentProvider.select((v) => v.chember));
    final apptNotifier = ref.watch(newAppointmentProvider.notifier);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(
            chembers.length,
            (index) => InkWell(
              onTap: () => apptNotifier.setChember = chembers[index],
              child: Container(
                width: context.width * 0.55,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: selectedChember == chembers[index] ? 2 : 1,
                    color: selectedChember == chembers[index]
                        ? context.theme.primaryColor
                        : Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        chembers[index].name ?? '-',
                        style: context.text.titleSmall!.copyWith(fontSize: 12),
                      ),
                      Text(
                        chembers[index].address ?? '-',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

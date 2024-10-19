import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/components/first.time.visit.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/appointments.dart';
import 'package:doc_appointment/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAppointment extends ConsumerWidget {
  const CreateAppointment({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(appointmentsProvider);
    final patientNotifier = ref.watch(patientProvider.notifier);

    final selectedGender = ref.watch(patientProvider.select((v) => v.gender));
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 20.toHeight,
                // const DatePickerR  ow(),
                10.toHeight,
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
                  '* You will be notified thruogh sms once your appointment is confirmed.',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                // const NotifyMethodContainer(),
                10.toHeight,
                const FirstTimeVisit(),
                10.toHeight,
                const OrSection(),
                10.toHeight,
                const Center(
                  child: CallForAppointmentButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrSection extends StatelessWidget {
  const OrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: context.theme.colorScheme.primary,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'OR',
            style: context.theme.textTheme.titleMedium!.copyWith(
                color: context.theme.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 2,
            color: context.theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class CallForAppointmentButton extends StatelessWidget {
  const CallForAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 220,
      child: OutlinedButton.icon(
        onPressed: () {
          Launcher.callNumber('01964492442');
        },
        label: const Text('Call For Appointment'),
        icon: const Icon(Icons.phone),
      ),
    );
  }
}

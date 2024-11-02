import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/appointments.dart';
import 'package:doc_appointment/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/appointment.form.dart';
import 'components/chember.detail.section.dart';

class CreateAppointment extends ConsumerWidget {
  const CreateAppointment({super.key, this.chember});
  final Chember? chember;
  @override
  Widget build(BuildContext context, ref) {
    ref.watch(appointmentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (chember != null) ...[
                Text(
                  chember?.name ?? '',
                  style: context.text.titleLarge!
                      .copyWith(color: context.theme.primaryColor),
                ),
                const ChemberDetailSection(),
              ],
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Appointment Form',
                      style: context.text.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              20.toHeight,
              const AppointmentForm(),
              10.toHeight,
              const OrSection(),
              10.toHeight,
              const Center(
                child: CallForAppointmentButton(),
              ),
              10.toHeight,
            ],
          ),
        ),
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

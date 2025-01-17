import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/view/components/custom.bottom.bar.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/create.success.dialog.dart';
import 'package:driftekhar_patient/src/utils/ui/loader.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/appt.form.dart';

class BookAppointmentView extends ConsumerWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newAppt = ref.watch(newAppointmentProvider);
    final patientData = ref.watch(patientProvider);
    final fee = newAppt.type?.fee ?? 0;
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.toHeight,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      newAppt.chember?.name ?? '',
                      style: context.text.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              10.toHeight,
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
              10.toHeight,
              const AppointmentForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PayAndConfimButton(
        fee: fee,
        // onConfirm: () async => await _handleSubmit(context, ref),
        onConfirm: !patientData.isValid
            ? null
            : () async => await _handleSubmit(context, ref),
      ),
    );
  }

  Future _handleSubmit(BuildContext context, WidgetRef ref) async {
    if (!apptFormKey.currentState!.validate()) return false;

    await showLoader( );
    final success = await ref.read(newAppointmentProvider.notifier).createNew();
    if (!context.mounted) return;
    context.pop();
    if (!success) {
      context.showSnack('Could not craete your appointment');
    } else {
      context.pop();
      context.pop();
      await showCreateSuccessDialog(context);
    }
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

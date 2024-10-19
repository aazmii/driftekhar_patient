import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/doctor.modules/appointments/providers/appointments.dart';
import 'package:doc_appointment/src/modules/patient.modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PayAndConfimButton extends StatelessWidget {
  const PayAndConfimButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consultation Fee', style: context.text.titleSmall),
                  Text(
                    'TK. 700',
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Consumer(builder: (context, ref, child) {
                final newAppointment = ref.watch(newAppointmentProvider);
                return FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: !newAppointment.patientData!.isValid
                      ? null
                      : () {
                          final newAppointment =
                              ref.read(newAppointmentProvider);

                          ref
                              .read(appointmentsProvider.notifier)
                              .addAppointment(newAppointment);
                          ref.invalidate(newAppointmentProvider);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Request sent Successfully'),
                          ));
                        },
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

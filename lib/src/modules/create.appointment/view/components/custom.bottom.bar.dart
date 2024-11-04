import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PayAndConfimButton extends StatelessWidget {
  const PayAndConfimButton({
    super.key,
    this.fee,
    this.onConfirm,
    this.confirmText,
  });
  final int? fee;
  final VoidCallback? onConfirm;
  final String? confirmText;

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
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consultation Fee', style: context.text.titleSmall),
                  Text(
                    fee == 0 ? 'Free' : 'TK. ${fee ?? 0}',
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
                // final newAppointment = ref.watch(newAppointmentProvider);
                return FilledButton(
                  style: FilledButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: onConfirm,
                  // onPressed: !newAppointment.patientData!.isValid
                  //     ? null
                  //     : () {
                  //         final newAppointment =
                  //             ref.read(newAppointmentProvider);

                  //         ref
                  //             .read(appointmentsProvider.notifier)
                  //             .addAppointment(newAppointment);
                  //         ref.invalidate(newAppointmentProvider);
                  //         ScaffoldMessenger.of(context)
                  //             .showSnackBar(const SnackBar(
                  //           content: Text('Request sent Successfully'),
                  //         ));
                  //       },
                  child: Text(
                    confirmText ?? 'Book Appointment',
                    style: const TextStyle(fontSize: 14),
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

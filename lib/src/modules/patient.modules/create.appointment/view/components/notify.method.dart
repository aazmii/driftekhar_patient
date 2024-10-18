import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/patient.modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifyMethodContainer extends ConsumerWidget {
  const NotifyMethodContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final apptNotifier = ref.watch(newAppointmentProvider.notifier);
    final selectedMethod =
        ref.watch(newAppointmentProvider.select((v) => v.notifyMethod));
    return Row(
      children: [
        Expanded(
          child: RadioListTile<NotifyMethod>(
            contentPadding: EdgeInsets.zero,
            value: NotifyMethod.sms,
            groupValue: selectedMethod,
            onChanged: (v) => apptNotifier.setNotifyMethod = v!,
            title: const Text('SMS'),
          ),
        ),
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: NotifyMethod.email,
            groupValue: selectedMethod,
            onChanged: (v) => apptNotifier.setNotifyMethod = v!,
            title: const Text('Email'),
          ),
        ),
      ],
    );
  }
}

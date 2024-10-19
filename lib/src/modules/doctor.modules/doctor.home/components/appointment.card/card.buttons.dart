import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/date.time.picker.dart';
import 'package:flutter/material.dart';

class RescheduleButton extends StatelessWidget {
  const RescheduleButton({
    super.key,
    required this.appointment,
    this.onReschedule,
  });
  final Appointment appointment;
  final ValueSetter<DateTime>? onReschedule;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(55),
      ),
      onPressed: () async {
        final pickedDate = await getSelectedDateTime();
        if (pickedDate != null) onReschedule?.call(pickedDate);
      },
      child: const Text('Reschedule'),
    );
  }
}

class ApproveButton extends StatelessWidget {
  const ApproveButton(
      {super.key, this.onApproveOrUpdate, required this.appointment});
  final Appointment appointment;
  final VoidCallback? onApproveOrUpdate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: appointment.isValid ? onApproveOrUpdate : null,
        child: Text(appointment.isConfirmed ? 'Update' : 'Approve'),
      ),
    );
  }
}

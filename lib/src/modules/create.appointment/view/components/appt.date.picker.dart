import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePickerRow extends ConsumerStatefulWidget {
  const DatePickerRow({super.key});

  @override
  DatePickerRowState createState() => DatePickerRowState();
}

class DatePickerRowState extends ConsumerState<DatePickerRow> {
  // Function to handle date selection
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(newAppointmentProvider.notifier);
    final selectedDate =
        ref.watch(newAppointmentProvider.select((v) => v.dateTime));

    return InkWell(
      onTap: () async {
        final updated = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (updated != null) {
          notifier.setApptDate = updated;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Text(selectedDate != null ? selectedDate.toDate : 'Select Date'),
      ),
    );
  }
}

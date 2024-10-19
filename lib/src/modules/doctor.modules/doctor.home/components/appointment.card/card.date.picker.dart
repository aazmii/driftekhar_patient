import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/date.time.picker.dart';
import 'package:flutter/material.dart';

class CardDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  const CardDatePicker({super.key, this.initialDate, this.onDateSelected});
  final ValueSetter<DateTime>? onDateSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pickedDate = await getSelectedDateTime();
        if (pickedDate != null) onDateSelected?.call(pickedDate);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_month,
            color: context.theme.primaryColor,
          ),
          const SizedBox(width: 10),
          Text(
            initialDate == null ? 'Select Date' : initialDate!.toDateAndTime,
            style: context.text.titleMedium!.copyWith(
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

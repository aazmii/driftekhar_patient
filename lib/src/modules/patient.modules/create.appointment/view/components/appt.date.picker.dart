import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For formatting the date

class DatePickerRow extends ConsumerStatefulWidget {
  const DatePickerRow({super.key});

  @override
  DatePickerRowState createState() => DatePickerRowState();
}

class DatePickerRowState extends ConsumerState<DatePickerRow> {
  // Function to handle date selection

  @override
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(newAppointmentProvider.notifier);
    final selectedDate =
        ref.watch(newAppointmentProvider.select((v) => v.dateTime));
    return Row(
      children: [
        const Text('Select Date'),
        10.toWidth,
        Expanded(
          child: TextFormField(
            initialValue: selectedDate != null
                ? DateFormat('dd/MM/yyyy').format(selectedDate)
                : '',
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Selected Date',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
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
          ),
        ),
      ],
    );
  }
}

class DatePicker extends ConsumerStatefulWidget {
  const DatePicker({super.key});

  @override
  ConsumerState<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends ConsumerState<DatePicker> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(newAppointmentProvider.notifier);
    final selectedDate =
        ref.watch(newAppointmentProvider.select((v) => v.dateTime));
    return EasyDateTimeLine(
      initialDate: selectedDate!,
      headerProps: const EasyHeaderProps(
        // showHeader: false,
        monthPickerType: MonthPickerType.switcher,
      ),
      onDateChange: (selectedDate) {
        notifier.setApptDate = selectedDate;
        notifier.setWeekDay = selectedDate.weekDayName;
      },
      dayProps: const EasyDayProps(
        height: 50.0,
        width: 50.0,
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: DayStyle(
          borderRadius: 48.0,
          dayNumStyle: TextStyle(fontSize: 18.0),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

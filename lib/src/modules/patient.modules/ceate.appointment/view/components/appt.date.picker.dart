import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/providers/new.appointment.provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        ref.watch(newAppointmentProvider.select((v) => v.apptDate));
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

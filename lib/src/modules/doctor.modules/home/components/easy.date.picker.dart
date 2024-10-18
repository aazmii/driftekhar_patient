import 'package:doc_appointment/src/modules/patient.modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EasyDatePicker extends ConsumerStatefulWidget {
  const EasyDatePicker({super.key});

  @override
  ConsumerState<EasyDatePicker> createState() => _EasyDatePickerState();
}

class _EasyDatePickerState extends ConsumerState<EasyDatePicker> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(newAppointmentProvider.notifier);
    final selectedDate =
        ref.watch(newAppointmentProvider.select((v) => v.dateTime));
    if (selectedDate == null) return const SizedBox();
    return EasyDateTimeLine(
      initialDate: selectedDate,
      headerProps: const EasyHeaderProps(
        // showHeader: false,
        monthPickerType: MonthPickerType.switcher,
      ),
      onDateChange: (selectedDate) {
        notifier.setApptDate = selectedDate;
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

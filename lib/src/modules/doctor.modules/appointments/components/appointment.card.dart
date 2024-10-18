import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/date.time.picker.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard(
      {super.key, required this.appointment, this.onApprove, this.onReject});
  final Appointment appointment;
  final ValueSetter<Appointment>? onApprove;
  final VoidCallback? onReject;

  @override
  AppointmentCardState createState() => AppointmentCardState();
}

class AppointmentCardState extends State<AppointmentCard> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? selectedDateTime;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: context.theme.secondaryHeaderColor,
            ),
            height: 50,
            child: CardHeader(appointmentDate: widget.appointment.dateTime!),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.appointment.patientData?.name ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Age: ${widget.appointment.patientData?.age ?? ''}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Phone: ${widget.appointment.patientData?.phone ?? ''}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          // enabledBorder: InputBorder.none,
                          // border: InputBorder.none,
                          // focusedBorder: InputBorder.none,
                          labelText: 'Schedule',
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final dateTime = await getSelectedDateTime();
                          if (dateTime != null) {
                            _dateController.text = dateTime.formatted;
                            widget.appointment.dateTime = dateTime;
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                        ),
                        onPressed: () =>
                            widget.onApprove?.call(widget.appointment),
                        child: const Text('Approve'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Function to open the DateTime picker
class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.appointmentDate});
  final DateTime appointmentDate;
  @override
  Widget build(BuildContext context) {
    final style = context.text.titleMedium!.copyWith(color: Colors.white);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: context.theme.primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                5.toWidth,
                Text(
                  DateFormat('EEE, d MMMM').format(appointmentDate),
                  style: style,
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  color: Colors.white,
                ),
                5.toWidth,
                Text(
                  DateFormat('hh a').format(appointmentDate),
                  style: style,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

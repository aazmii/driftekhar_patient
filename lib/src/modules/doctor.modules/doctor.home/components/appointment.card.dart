import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/confirm.dialog/confirm.dialog.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/date.time.picker.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onApprove,
    this.onDateSelected,
    this.onReject,
    this.onReschedule,
  });
  final Appointment appointment;
  final VoidCallback? onApprove;

  final VoidCallback? onReject;
  final ValueSetter<DateTime>? onDateSelected;
  final ValueSetter<DateTime>? onReschedule;

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
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topLeft,
      fit: StackFit.loose,
      children: [
        Card(
          elevation: 4,
          // margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              20.toHeight,
              widget.appointment.status == AppointmentStatus.confirmed
                  ? CardHeader(appointmentDate: widget.appointment.dateTime!)
                  : const SizedBox.shrink(),
              Row(
                children: [
                  Container(
                    width: 3,
                    height: 145,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.appointment.patientData?.name ??
                                          '',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
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
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    widget.appointment.isConfirmed
                                        ? RescheduleButton(
                                            appointment: widget.appointment,
                                            onReschedule: widget.onReschedule,
                                          )
                                        : ApproveButton(
                                            appointment: widget.appointment,
                                            onApprove: widget.onApprove,
                                          ),
                                    5.toHeight,
                                    TextButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor:
                                            context.theme.colorScheme.error,
                                        minimumSize: const Size.fromHeight(55),
                                      ),
                                      onPressed: () async {
                                        final isConfirmed =
                                            await ConfirmDialog.show(context,
                                                'Are you sure to reject the appointment?');
                                        if (isConfirmed == null ||
                                            !isConfirmed) {
                                          return;
                                        }
                                        widget.onReject?.call();
                                      },
                                      child: const Text('Reject'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (!widget.appointment.isConfirmed)
                            CardDatePicker(
                              initialDate: widget.appointment.dateTime,
                              onDateSelected: (dateTime) async {
                                _dateController.text = dateTime.toDate;
                                widget.onDateSelected?.call(dateTime);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: widget.appointment.isFirstTime!
                  ? Colors.green.shade200
                  : Colors.blue.shade200,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              widget.appointment.isFirstTime! ? 'New' : 'Follow Up',
              style: context.text.titleMedium!.copyWith(),
            ),
          ),
        ),
      ],
    );
  }
}

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
  const ApproveButton({super.key, required this.appointment, this.onApprove});
  final Appointment appointment;
  final VoidCallback? onApprove;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(55),
      ),
      onPressed: appointment.dateTime == null ? null : () => onApprove?.call(),
      child: const Text('Approve'),
    );
  }
}

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
            initialDate == null ? 'Select Date' : initialDate!.toDate,
            // : DateFormat.yMMMd().format(initialDate!),
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

// Function to open the DateTime picker
class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.appointmentDate});
  final DateTime appointmentDate;
  @override
  Widget build(BuildContext context) {
    final style = context.text.titleMedium!.copyWith(color: Colors.white);
    return Container(
      height: 50,
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
                  appointmentDate.toDate,
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
                  appointmentDate.toTime,
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

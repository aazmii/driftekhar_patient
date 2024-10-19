import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/modules/confirm.dialog/confirm.dialog.dart';
import 'package:flutter/material.dart';

import 'card.buttons.dart';
import 'card.date.picker.dart';
import 'card.header.dart';
import 'chember.dropdown.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onApprove,
    this.onDateSelected,
    this.onReject,
    this.onUpdate,
    this.onChemberSelected,
  });
  final Appointment appointment;
  final VoidCallback? onApprove;
  final ValueSetter<Chember?>? onChemberSelected;

  final VoidCallback? onReject;
  final ValueSetter<DateTime>? onDateSelected;
  final VoidCallback? onUpdate;

  @override
  AppointmentCardState createState() => AppointmentCardState();
}

class AppointmentCardState extends State<AppointmentCard> {
  DateTime? selectedDateTime;

  final containerHeight = 180.0;

  @override
  Widget build(BuildContext context) {
    final showHeader = widget.appointment.status == AppointmentStatus.confirmed;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topLeft,
      children: [
        Card(
          elevation: 8,
          child: SizedBox(
            height: showHeader ? containerHeight + 40 : containerHeight,
            // height: showHeader ? containerHeight + 40 : containerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.appointment.status == AppointmentStatus.confirmed
                    ? CardHeader(appointmentDate: widget.appointment.dateTime!)
                    : const SizedBox.shrink(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.appointment.patientData?.name ?? '',
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ChemberDropdown(
                                  appointment: widget.appointment,
                                  onChemberSelected: widget.onChemberSelected,
                                ),
                                CardDatePicker(
                                  initialDate: widget.appointment.dateTime,
                                  onDateSelected: (dateTime) async {
                                    widget.onDateSelected?.call(dateTime);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.red.shade300,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () async {
                                final confirm = await ConfirmDialog.show(
                                  context,
                                  'Are you sure you want to reject this appointment?',
                                );
                                if (confirm == null) return;
                                if (!confirm) return;
                                widget.onReject?.call();
                              },
                              child: const Text('Reject'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ApproveButton(
                            appointment: widget.appointment,
                            onApproveOrUpdate: () {
                              if (!widget.appointment.isConfirmed) {
                                widget.onUpdate?.call();
                                context.showSnack('Updated Successfully');
                              } else {
                                widget.onApprove?.call();
                                context.showSnack('Appointmtent Requeested ');
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: -10,
        //   left: 4,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(4),
        //       color: widget.appointment.isFirstTime!
        //           ? Colors.green.shade200
        //           : Colors.blue.shade200,
        //     ),
        //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //     child: Text(
        //       widget.appointment.isFirstTime! ? 'New' : 'Follow Up',
        //       style: context.text.titleMedium!.copyWith(),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

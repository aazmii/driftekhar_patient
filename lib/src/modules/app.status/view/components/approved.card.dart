import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/constants/ui.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApprovedCard extends StatefulWidget {
  const ApprovedCard({
    super.key,
    required this.appt,
  });
  final Appointment appt;

  @override
  AppointmentCardState createState() => AppointmentCardState();
}

class AppointmentCardState extends State<ApprovedCard> {
  DateTime? selectedDateTime;

  final containerHeight = 140.0;

  @override
  Widget build(BuildContext context) {
    final age = widget.appt.patientData?.age;

    // final type = widget.appt.type?.name.toUpperCase();
    final textStyle = context.text.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(appointmentDate: widget.appt.dateTime ?? DateTime.now()),
          5.toHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,s
              children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: iconSize,
                  color: context.theme.primaryColor,
                ),
                10.toWidth,
                Expanded(
                  child:
                      Text(widget.appt.chember?.name ?? '', style: textStyle),
                ),
              ],
            ),
          ),
          5.toHeight,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.userGroup,
                  size: iconSize,
                  color: context.theme.primaryColor,
                ),
                10.toWidth,
                Text(
                  'Serial : ',
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // 10.toWidth,
                Text(
                  '${widget.appt.serial ?? ''}',
                  style: textStyle,
                  // ),
                ),
              ],
            ),
          ),
          5.toHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.userLarge,
                            size: iconSize,
                            color: context.theme.primaryColor,
                          ),
                          5.toWidth,
                          Text(
                              '${widget.appt.patientData?.name ?? ''}${age != null ? ', $age' : ''}',
                              style: textStyle),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.phone,
                            size: iconSize,
                            color: context.theme.primaryColor,
                          ),
                          5.toWidth,
                          Text(
                            widget.appt.patientData?.phone ?? '',
                            style: context.text.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.toHeight,
        ],
      ),
    );
  }
}
// Function to open the DateTime picker

class _CardHeader extends StatelessWidget {
  const _CardHeader({required this.appointmentDate});
  final DateTime appointmentDate;
  @override
  Widget build(BuildContext context) {
    final style = context.text.titleMedium!.copyWith(color: Colors.white);
    return Container(
      height: 40,
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
                const Icon(Icons.calendar_month, color: Colors.white),
                5.toWidth,
                Text(appointmentDate.toDate, style: style),
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
                Text(appointmentDate.toTime, style: style),
              ],
            ),
          )
        ],
      ),
    );
  }
}

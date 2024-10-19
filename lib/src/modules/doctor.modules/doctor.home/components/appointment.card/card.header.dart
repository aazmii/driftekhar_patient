// Function to open the DateTime picker
import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.appointmentDate});
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

import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class EmptyApptWidget extends StatelessWidget {
  const EmptyApptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/png/online.appointment.png',
            height: 100,
            width: 100,
          ),
          10.toHeight,
          Text('No appointments', style: context.text.titleLarge),
          10.toHeight,
          Text(
            'Your appointments will appear here',
            style: context.text.titleMedium,
          ),
        ],
      ),
    );
  }
}

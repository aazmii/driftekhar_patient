import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ApptStatusView extends StatelessWidget {
  const ApptStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Appointment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/png/online.appointment.png',
              height: 100,
              width: 100,
            ),
            Text(
              'You have no appointments yet',
              style: context.text.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            10.toWidth,
            Text(
              'Initializing app ..',
              style: context.text.titleLarge!
                  .copyWith(color: Colors.grey.shade800),
            )
          ],
        ),
      ),
    );
  }
}

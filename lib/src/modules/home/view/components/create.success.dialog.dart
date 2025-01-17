import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future showCreateSuccessDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => const CreateSuccessDialog(),
  );
}

class CreateSuccessDialog extends StatelessWidget {
  const CreateSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/lotties/success.json',
                height: 100, width: 100, repeat: false),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Request sent',
                style: context.text.titleLarge!.copyWith(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Please wait for approval, soon you will get an SMS from doctor',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
      // title: Text('Your request has been sent',
      //     style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

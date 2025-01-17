import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnknownErrorWidget extends StatelessWidget {
  const UnknownErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Icon(FontAwesomeIcons.wifiExclamation  , size: 50),
        const Icon(
          FontAwesomeIcons.triangleExclamation,
          size: 50,
          color: Colors.red,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Something went wrong',
            style: context.text.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text('Please wait for a while and try again'),
      ],
    );
  }
}

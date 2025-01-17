import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key, this.msg});
  final String? msg;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 100,
          width: 200,
          child: Lottie.asset(
            'assets/lotties/loader.json',
            repeat: true,
            reverse: true,
            animate: true,
          ),
        ),
      ),
    );
  }
}

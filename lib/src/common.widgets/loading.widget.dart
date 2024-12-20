import 'package:com.codeconnect.driftekhar.patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

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
          child: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 10),
              Flexible(child: Text(msg!, style: context.text.titleMedium!)),
            ],
          ),
        ),
      ),
    );
  }
}

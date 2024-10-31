import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class DocProfessionCard extends StatelessWidget {
  const DocProfessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // color: Colors.green.shade100,
        color: context.theme.secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Dr. Md. Iftekhar Alam ',
                style: context.text.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                children: [
                  TextSpan(
                      text: '\nAssistant Professor',
                      style: context.text.titleSmall!),
                  TextSpan(
                    text: '\nOrthopedic & Trauma Surgeon',
                    style: context.text.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

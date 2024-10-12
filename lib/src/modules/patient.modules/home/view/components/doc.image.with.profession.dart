import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/image.links.dart';
import 'package:flutter/material.dart';

class ImageWithProfessionWidget extends StatelessWidget {
  const ImageWithProfessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(image: NetworkImage(SurgonImages.image4)),
        Positioned(
          bottom: 30,
          left: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
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
                  // Text('Asst. Prof. Dr. Mohammad Iftekhar Alam'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookApptButton extends StatelessWidget {
  const BookApptButton({super.key, this.onPressed});
  final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: DottedBorder(
        strokeWidth: 2,
        color: context.theme.primaryColor,
        dashPattern: const [8, 3],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                height: 70,
                width: 70,
                'assets/lotties/pointWithFinger.json',
              ),
              Text(
                'Appointment',
                style: context.text.titleLarge!.copyWith(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

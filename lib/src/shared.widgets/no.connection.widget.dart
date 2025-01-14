import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Icon(FontAwesomeIcons.wifiExclamation  , size: 50),
        SvgPicture.asset('assets/icons/wifi.slash.svg',
            height: context.width * 0.2),
        Text(
          'No internet connection',
          style: context.text.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Please check your internet connection and try again',
        ),
      ],
    );
  }
}

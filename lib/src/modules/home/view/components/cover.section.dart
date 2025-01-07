import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/components/social.icons.dart';
import 'package:flutter/material.dart';

import 'surgon.carousel.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.height * 0.3,
          color: primaryColor,
          child: SurgonCarousel(),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: SafeArea(
              child: Image.asset(
                'assets/images/png/dr.iftekhar.png',
                color: Colors.white,
                // 'assets/images/png/logo.png',
                height: context.width * 0.12,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: context.isTabletWidth ? 0 : -40,
          right: 0,
          child: const SocialIcons(),
        ),
        Positioned(
          bottom: -50,
          left: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/icons/app.icon.png'),
            ),
          ),
        ),
        Positioned(
          bottom: context.isTabletWidth ? -80 : -130,
          left: context.isTabletWidth ? 120 : 10,
          // bottom: -80,
          // left: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Asst Prof. Dr. Mohammad Iftekhar Alam',
                style: context.isTabletWidth
                    ? context.text.titleLarge!.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      )
                    : context.text.titleMedium!.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
              ),
              Text(
                'Assistant Professor (Orthopaedic Surgery)​',
                style: context.text.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              Text(
                'Dr.Sirajul Islam Medical College,Dhaka.​',
                style: context.text.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

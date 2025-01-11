import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/social.icons.dart';
import 'package:flutter/material.dart';

import 'surgon.carousel.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          children: [
            Expanded(
              flex: 5,
              child: ColoredBox(
                color: context.theme.primaryColor,
                child: SurgonCarousel(),
              ),
            ),
            const Expanded(child: SocialIcons()),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: context.height * 0.06),
          child: Image.asset(
            'assets/images/png/dr.iftekhar.png',
            color: Colors.white,
            height: context.width * 0.12,
          ),
        ),
        Positioned(
          bottom: 10,
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
      ],
    );
  }
}

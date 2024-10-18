import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<String> icons = 'youtube,insta,snap,tiktok,whatsapp'.split(',');

class ImageWithProfessionWidget extends StatelessWidget {
  const ImageWithProfessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Image(
            // image: Assets.images.jpg.doc.provider(),
            image: AssetImage('assets/images/jpg/doc.jpg'),
            // image: NetworkImage(imageLInk),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 70,
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
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                icons.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SocialIconHolder(name: icons[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SocialIconHolder extends StatelessWidget {
  const SocialIconHolder({super.key, required this.name, this.title});
  final side = 60.0;
  final String name;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      height: 40,
      width: 40,
    );
  }
}

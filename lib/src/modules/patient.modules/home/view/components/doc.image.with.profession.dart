import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/social.link.model/social.link.dart';
import 'package:doc_appointment/src/providers/social.link.providers.dart';
import 'package:doc_appointment/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

final List<String> icons = 'youtube,insta,snap,tiktok,whatsapp'.split(',');

class ImageWithProfessionWidget extends StatelessWidget {
  const ImageWithProfessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/images/jpg/doc.jpg'),
            fit: BoxFit.cover,
            // image: NetworkImage(imageLInk),
          ),
        ),
        Positioned(
          bottom: 70,
          left: 0,
          child: DecoratedBox(
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
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 50,
            child: Consumer(
              builder: (context, ref, child) {
                final linkModels = ref.watch(socialLinksPProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    linkModels.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SocialIconHolder(
                        socialLink: linkModels[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SocialIconHolder extends StatelessWidget {
  const SocialIconHolder({
    super.key,
    required this.socialLink,
  });
  final side = 60.0;
  final SocialLink socialLink;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (socialLink.link == 'whatsapp') return;
        Launcher.browseSocialLink(socialLink.link!);
      },
      child: SvgPicture.asset(
        'assets/icons/${socialLink.icon}.svg',
        height: 40,
        width: 40,
      ),
    );
  }
}

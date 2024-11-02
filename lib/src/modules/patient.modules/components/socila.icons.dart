import 'package:doc_appointment/src/models/social.link.model/social.link.dart';
import 'package:doc_appointment/src/providers/social.link.providers.dart';
import 'package:doc_appointment/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcons extends ConsumerWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final linkModels = ref.watch(socialLinksPProvider);

    return Row(
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
  }
}

class SocialIconHolder extends StatelessWidget {
  const SocialIconHolder({
    super.key,
    required this.socialLink,
  });

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
        height: 30,
        width: 30,
      ),
    );
  }
}

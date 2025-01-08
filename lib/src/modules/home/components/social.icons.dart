import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcons extends ConsumerWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final linkModels = ref.watch(socialLinksPProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TappableIcon(
          iconPath: 'assets/icons/youtube.svg',
          onTap: () async => await Launcher.browseLink(youtubeLink),
        ),
        20.toWidth,
        TappableIcon(
          iconPath: 'assets/icons/facebook.svg',
          onTap: () async => await Launcher.browseLink(facebookLink),
        ),
        20.toWidth,
        TappableIcon(
          iconPath: 'assets/icons/tiktok.svg',
          onTap: () async => await Launcher.browseLink(tiktokLink),
        ),
        10.toWidth,
      ],
    );
  }
}

class TappableIcon extends StatelessWidget {
  const TappableIcon({
    super.key,
    required this.iconPath,
    this.onTap,
  });
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(iconPath, height: 30, width: 30),
    );
  }
}

import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/social.link.page/provider/data.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLinksView extends StatelessWidget {
  const SocialLinksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: List.generate(socialLinkData.length, (i) {
          // return Text(socialLinkData[i].icon ?? '');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () => Launcher.browseLink(socialLinkData[i].link ?? ''),
              leading: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  'assets/icons/${socialLinkData[i].icon}',
                ),
              ),
              title: Text(
                socialLinkData[i].name ?? '',
                style: context.text.titleMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        }),
      ),
    );
  }
}

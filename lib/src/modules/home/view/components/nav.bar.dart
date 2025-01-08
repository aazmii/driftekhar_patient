import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/nav.model.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FoatingNavBar extends StatelessWidget {
  FoatingNavBar({super.key});
  final items = [
    NavItem(icon: Icons.phone, label: 'Call'),
    NavItem(icon: Icons.calendar_month, label: 'Appoint.'),
    NavItem(icon: FontAwesomeIcons.facebookMessenger, label: 'Messenger'),
    NavItem(icon: FontAwesomeIcons.whatsapp, label: 'Whatsapp'),
  ];
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxWidth: 300, minWidth: 200, maxHeight: 80),
      child: Row(
        mainAxisAlignment: context.isTabletWidth
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.spaceBetween,
        children: items
            .map((e) => InkWell(
                  onTap: () => handleAction(context, e.label!),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(e.icon, color: context.theme.primaryColor),
                      Text(
                        e.label ?? '',
                        style: TextStyle(color: context.theme.primaryColor),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

Future handleAction(BuildContext context, String name) async {
  if (name == 'Call') {
    await Launcher.callNumber(callingNumber);
  } else if (name == 'Appoint.') {
    await Navigator.pushNamed(context, chemberSelectionRoute);
  } else if (name == 'Messenger') {
    Launcher.browseLink(facebookLink);
  } else if (name == 'Whatsapp') {
    await Launcher.openWhatsApp('+8801964492442');
  }
}

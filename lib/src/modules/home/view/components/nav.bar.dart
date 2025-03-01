import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/nav.model.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final items = [
  NavItem(icon: Icons.home, label: 'Home'),
  NavItem(icon: Icons.calendar_month, label: 'Appoint.'),
  NavItem(icon: FontAwesomeIcons.userDoctor, label: 'Profile'),
  // NavItem(icon: Icons.phone, label: 'Call'),
  // NavItem(icon: FontAwesomeIcons.facebookMessenger, label: 'Messenger'),
  // NavItem(icon: FontAwesomeIcons.whatsapp, label: 'Whatsapp'),
];

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColor.withAlpha(10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      ),
    );
  }
}

Future handleAction(BuildContext context, String name) async {
  if (name == 'Call') {
    await Launcher.callNumber(callingNumber);
  } else if (name == 'Appoint.') {
    await Navigator.pushNamed(context, apptStatusRoute);
  } else if (name == 'Profile') {
    await Navigator.pushNamed(context, profileRoute);
  }
}

import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Theme(
        data: Theme.of(context).copyWith(
            listTileTheme: ListTileThemeData(
          iconColor: context.theme.primaryColor,
          // tileColor: Colors.transparent,
        )),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: context.theme.primaryColor),
              child: Column(
                children: [
                  Text(
                    'Dr. Iftekhar Alam',
                    style: context.text.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Row(),
                ],
              ),
            ),
            ListTile(
              onTap: () async =>
                  await Launcher.sendMail('mailbox.azmi@gmail.com', 'Feedback'),
              tileColor: Colors.transparent,
              leading: const Icon(Icons.email),
              title: const Text('Send Feedback'),
            ),
            ListTile(
              onTap: () => Launcher.browseLink(privacyLink),
              tileColor: Colors.transparent,
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
            ),
            const Spacer(),
            const Text('Version 0.1.0+8'),
            10.toHeight,
          ],
        ),
      ),
    );
  }
}

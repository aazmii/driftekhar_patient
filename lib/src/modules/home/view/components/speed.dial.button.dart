import 'package:driftekhar_patient/src/constants/doc.contants.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

class SpeedDialButton extends StatelessWidget {
  const SpeedDialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // animatedIcon: AnimatedIcons.menu_close,
      icon: FontAwesomeIcons.commentMedical,
      activeIcon: Icons.close,
      overlayOpacity: 0.7,
      children: [
        SpeedDialChild(
          foregroundColor: Colors.black,
          labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          child: const Icon((Icons.call)),
          label: 'Call',
          onTap: () async => await Launcher.callNumber(callingNumber),
        ),
        SpeedDialChild(
          // foregroundColor: Colors.green,
          backgroundColor: Colors.green.shade50,
          child: const Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors.green,
          ),
          labelStyle: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),

          label: 'Whatsapp',
          onTap: () async => await Launcher.openWhatsApp(whastsappNumber),
        ),
        SpeedDialChild(
          backgroundColor: Colors.blue.shade50,
          labelStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          child: const Icon(FontAwesomeIcons.facebookMessenger, color: Colors.blue),
          label: 'Messenger',
          // onTap: () async => await Launcher.openMessenger(messengerLink)
          onTap: () async => await Launcher.browseLink(facebookLink),
        ),
        SpeedDialChild(
          backgroundColor: Colors.red.shade50,
          labelStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          child: const Icon(FontAwesomeIcons.envelope, color: Colors.grey),
          label: 'Email',
          onTap: () async => await Launcher.sendMail(docEmail, 'Feedback'),
        ),
      ],
    );
  }
}

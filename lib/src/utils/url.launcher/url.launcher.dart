import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Launcher {
  Launcher._();

  static Future openMap(double lat, double long) async {
    final googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not launch $googleUrl';
    }
  }

  static Future browseSocialLink(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(
        Uri.parse(link),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $link';
    }
  }

  static Future callNumber(String number) async {
    try {
      await launchUrlString("tel://$number");
    } catch (e) {
      rethrow;
    }
  }

  static Future openWhatsApp(String number) async {
    final whatsAppUrl = Uri.parse('https://wa.me/$number');
    launchUrl(whatsAppUrl);
  }
}

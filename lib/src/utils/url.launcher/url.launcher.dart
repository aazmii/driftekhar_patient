import 'package:fluttertoast/fluttertoast.dart';
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
      // throw 'Could not launch $googleUrl';
      await Fluttertoast.showToast(msg: 'Error');
    }
  }

  static Future browseLink(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(
        Uri.parse(link),
        mode: LaunchMode.externalApplication,
      );
    } else {
      await Fluttertoast.showToast(msg: 'Error');
    }
  }

  static Future sendMail(String mailTo, String subject) async {
    try {
      final Uri emailLaunchUri = Uri.parse('mailto:$mailTo?subject=$subject');
      await launchUrl(emailLaunchUri);
    } catch (e) {
      await Fluttertoast.showToast(msg: 'Error');
    }
  }

  static Future callNumber(String number) async {
    try {
      await launchUrlString("tel://$number");
    } catch (e) {
      await Fluttertoast.showToast(msg: 'Error');
      // rethrow;
    }
  }

  static Future openWhatsApp(String number) async {
    try {
      final whatsAppUrl = Uri.parse('https://wa.me/$number');
      launchUrl(whatsAppUrl);
    } catch (e) {
      await Fluttertoast.showToast(msg: 'Error');
    }
  }
}

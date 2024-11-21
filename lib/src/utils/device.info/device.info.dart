import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<String?> getUniqueDeviceId() async {
  final deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    return (await deviceInfo.androidInfo).id;
  } else if (Platform.isIOS) {
    return (await deviceInfo.iosInfo).identifierForVendor;
  } else {
    return null;
  }
}

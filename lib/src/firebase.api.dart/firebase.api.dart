import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static late final String? fcmToken;
  static Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true);

    try {
      fcmToken = await _firebaseMessaging.getToken();
      log('Token $fcmToken', name: 'fcm');
    } catch (e) {
      log('Exception ${e.toString()}', name: 'fcm');
    }
  }
}

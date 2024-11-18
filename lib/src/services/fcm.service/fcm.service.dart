import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final _firestore = FirebaseFirestore.instance;
  static late final String? fcmToken;

  static Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true);
  }

  static Future<void> registerFCMToken() async {
    String? fcmToken = await _firebaseMessaging.getToken();
    log('Token $fcmToken', name: 'fcm');

    if (fcmToken != null) await storeFCMToken(fcmToken);
  }

  static Future<void> storeFCMToken(String fcmToken) async {
    await _firestore.collection('tokens').doc(fcmToken).set({
      'fcmToken': fcmToken,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static void listenToTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      await storeFCMToken(newToken);
    });
  }
}

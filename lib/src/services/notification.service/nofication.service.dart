import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis/fcm/v1.dart';
 import 'package:googleapis_auth/auth_io.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationService.instance.initializeFlutterNotifications();
  await NotificationService.instance.showNotification(message);
}

class NotificationService {
  // Singleton pattern
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  bool _isInitialized = false;

  /// Initialize notification services
  Future<void> initialize() async {
    await _requestPermission();
    await _initializeFlutterLocalNotifications();
    await _setupMessageHandlers();
    debugPrint('FCM Token: ${await _messaging.getToken()}');
  }

  /// Request notification permissions
  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    debugPrint('Permission status: ${settings.authorizationStatus}');
  }

  /// Set up message handlers for foreground, background, and terminated states
  Future<void> _setupMessageHandlers() async {
    // Handle notification when the app is launched from a terminated state
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) await _handleMessage(initialMessage);

    // Handle notification when the app is in foreground
    FirebaseMessaging.onMessage.listen((message) => showNotification(message));

    // Handle notification when the app is opened via notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // Handle background notifications
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// Handle foreground and background messages
  Future<void> _handleMessage(RemoteMessage message) async {
    await showNotification(message);
  }

  /// Display a notification
  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final androidDetails = message.notification?.android;

    if (notification != null && androidDetails != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  }

  /// Initialize local notifications
  Future<void> _initializeFlutterLocalNotifications() async {
    if (_isInitialized) return;

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _localNotifications.initialize(initializationSettings);
    _isInitialized = true;
  }

  /// Public method for background handler to initialize local notifications
  Future<void> initializeFlutterNotifications() async {
    if (!_isInitialized) await _initializeFlutterLocalNotifications();
  }

  Future<void> sendNotificationToDevice(
      String? token, String? title, String? body) async {
 
    /// ? run the function in the background isolate to avoid UI blocking
    await compute((v) async {
      /// ? load the json file
      final credentials = ServiceAccountCredentials.fromJson(googleServices);

      /// ? create the client
      final client = await clientViaServiceAccount(
          credentials, [FirebaseCloudMessagingApi.cloudPlatformScope]);
   
      /// ? url of the fcm. || googleServices['project_id'] is the project id.
      final fcmEndpoint =
          'https://fcm.googleapis.com/v1/projects/${googleServices['project_id']}/messages:send';

      final notification = {
        'message': {
          'token': v.$1, // Replace with the FCM device registration token
          'notification': {
            'title': v.$2,
            'body': v.$3,
          },
        },
      };

      final response = await client.post(Uri.parse(fcmEndpoint),
          body: jsonEncode(notification));

      debugPrint('FCM Notification Response: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');
    }, (token, title, body));
  }

  final googleServices = {
    "type": "service_account",
    "project_id": "driftekhar-ec1e3",
    "private_key_id": "e0820c67c7503688c989864abaa584f15549b513",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDhY0s2DPsHIvXD\nuUtBFuYdPlWsKycjuzwz7wKcQuAHVp2JdnNnosPETDptrzUDOTMa6SmIM2lIYMYy\n9ll3gFDrvoFtB60OjtNQ73mHgml09ztJeMAPsU7kyufedcB1mC2+FhOpjahkcnn0\n1z+qfl1BZTPrwGkxYe5syFwrICWfneiD6AmSV839fq0VbplbWhQsgGZvO7+tzPZ4\nm7+1kHxZCno1TJs92oqVOq4gxin7Feojrv+6xWIKCstZ4playDlx7aAKrUaSs+Z5\n9ddJRtaFo06IQ73xVjcCv6w8in357L7kw99+dylv3DP34aGgfhkveQ1+wUW7LKbH\n43KXZHWdAgMBAAECggEAIElFAN0jKIaNhhgI+634EMBZLWyREsFDgnz+drvts59o\nucRKC9J5EKmKxSOQCIItG/HCjUwwDLowKiS39DJhZSPJDoFG/QrgontrgUnhKWwx\nBflSKe1QS931ERz1EONXyh8HegZc1ObBKZ2b9SRc331Lzr2lU/mfWd3pthPIz/Bd\n6GQYRtxHaBavaD2HlaF+PcOwKsUsq2CPm/sGi4BVdEijVW6xOpXxKE0hA+whUWXJ\n2jCxzP+RxQuUrsp98Rh4YB5BMWuWin6T+Qe1BikD1VWfAHHRAL1ABIC6erZdIOJr\ntyzBy/OelzLPrEl8COachtS6r0JYeVBTpm6GJ+SdgQKBgQD/Nee6D2r71eXCVwiK\nLIkjyohv5ewUn1oM1zVPqgjoIBHO/xY9SyGoMpO5S6jCS8kYY6EvJDoiOa2TEpXz\nm/wYrGmGPIf8VNPrx59Uk3zYNiLr511B7M9/W4M0woewst/fL0VjNlk2OLf0msAe\n14Jv4BKuXiaCe8T181icNBuClQKBgQDiFcXT9RykqQNHfLWwa1LZ7vNURjF4NlZA\n4EPKuhSyT34wAlinNkMy7lDAOr3uIhJgGB4ROT9B3p2+0Bo8D/4nTM6QRSAqHeKj\njloN1uRxweHHy07wcMbVRiOEJQSpFcKvrBnISbbp3f0exltr0G/llutLDswSchpw\nZoj3lwUs6QKBgCk8L3XLmfCYzefJojKZIYtr5QGXd76ZRLaAaze09H10+QumAZTj\nt8tyaJXu2JSUJCjRqDByvQXcpeP2g835rRDbgq1SyHIHzrnw5hiHQAu7K4dMObA2\nMAyW36s9pyjwreVkwORX2rA9F9Po0RPqpEOpQ7tysOwyTU+kAvQyIyPFAoGBANLx\nta9aV+tatvCQb4W33Ynx5Z+QDsA3EqtdlGMm1AC7IuXwin8ZpgFzUmzJYkU6DSMT\n3Zn8bAUtjMloqdG4qk5I38LEfIpPcBNi0qtvAZ8SY3NjQrgcwahk1OaLE5of75Kx\nZSz3em8i7PU15j7mMEFrWwahO89KH1kYkltQ0UdhAoGBAIB6u0LPjhO7oKfZkzD1\nQ+cQ1ZN7mQBbSxl5pTKTPChkF+5D64ex02P+/j0mkE8x48QtL22ZAHdTIwb15VaD\nNzdDffj/emkJE8uBtTm6sJZ+EINR1G2tr0f48JB+GMT0ZsCZPTYm5fQek4Hc6dro\nGz036uH0u7ZQFlyjICscNoqL\n-----END PRIVATE KEY-----\n",
    "client_email":
        "firebase-adminsdk-fg1gl@driftekhar-ec1e3.iam.gserviceaccount.com",
    "client_id": "113006922443787717363",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fg1gl%40driftekhar-ec1e3.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };
}

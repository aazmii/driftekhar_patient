import 'dart:io';

import 'package:driftekhar_patient/firebase_options.dart';
import 'package:driftekhar_patient/src/services/fcm.service/fcm.service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'src/app.dart' show MyApp;
// import 'src/db/isar.dart' show openDB;

void main() async {
  await _init().then((_) => runApp(const ProviderScope(child: MyApp())));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (Platform.isAndroid || Platform.isIOS) await FCMService.initNotification();
  //  AuthService.signInAnonymously();
  // FCMService.listenToTokenRefresh();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await openDB();
}

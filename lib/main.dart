import 'package:doc_appointment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'src/app.dart' show MyApp;
import 'src/db/isar.dart' show openDB;
import 'src/firebase.api.dart/firebase.api.dart';

void main() async =>
    await _init().then((_) => runApp(const ProviderScope(child: MyApp())));

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi.initNotification();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await openDB();
}

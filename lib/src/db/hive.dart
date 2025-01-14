import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

late final Box<String> apptsBox;
Future initHive() async {
  await Hive.initFlutter();
  await openBoxes();
}

Future openBoxes() async {
  apptsBox = await Hive.openBox('appointmentBox');
  log('Hive opened');
}

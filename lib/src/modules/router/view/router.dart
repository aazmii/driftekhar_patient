import 'package:doc_appointment/src/modules/home/view/patient.home.3.dart';
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PatientHome3();
    // return const HomeView();
  }
}

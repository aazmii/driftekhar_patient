import 'package:driftekhar_patient/src/modules/home/view/home.view.new.dart';
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const HomeViewNew();
    // return const HomeView();
  }
}

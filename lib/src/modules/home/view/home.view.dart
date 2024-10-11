import 'package:doc_appointment/src/l10n/localization.dart';
import 'package:flutter/material.dart';

import '../../router/provider/route.provider.dart';
import '../../setting/view/setting.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async => await fadePush(context, const SettingView()),
          child: Text(t!.setting),
        ),
      ),
    );
  }
}

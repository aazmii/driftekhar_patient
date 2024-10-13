import 'package:doc_appointment/src/theme/model/theme.model.dart';
import 'package:doc_appointment/src/theme/provider/theme.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text('Header'),
          ),
          Consumer(builder: (_, ref, __) {
            final theme = ref.watch(themeProvider);
            return ListTile(
              title: const Text('Enable dark '),
              trailing: Switch.adaptive(
                value: theme == ThemeProfile.dark,
                onChanged: (v) async {
                  await ref.read(themeProvider.notifier).toggleTheme();
                },
              ),
            );
          })
        ],
      ),
    );
  }
}

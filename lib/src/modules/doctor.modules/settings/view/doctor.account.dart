import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/doctor.modules/settings/components/setting.segment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/settings/modules/appointment.setting/view/appointment.setting.dart';
import 'package:flutter/material.dart';

class DoctorSettings extends StatelessWidget {
  const DoctorSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Theme(
            data: ThemeData(
                // textTheme: TextTheme(
                //   titleMedium: context.text.titleMedium!
                //       .copyWith(color: context.theme.primaryColor),
                //   bodyLarge: const TextStyle(fontSize: 14),
                // ),
                ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SegmentedSetting(
                    title: 'Account',
                    icon: Icons.person,
                    children: [
                      Text('Profile'),
                      Text('Password'),
                    ],
                  ),
                  const AppointmentSettingSegmentView(),
                  Card(
                    child: ListTile(
                      onTap: () => context.pop(),
                      trailing: Icon(
                        Icons.logout,
                        color: context.theme.colorScheme.error,
                      ),
                      title: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

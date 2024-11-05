import 'package:doc_appointment/src/modules/doctor.modules/settings/components/setting.segment.dart';
import 'package:flutter/material.dart';

class AppointmentSettingSegmentView extends StatelessWidget {
  const AppointmentSettingSegmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SegmentedSetting(
      title: 'Appointment Setting',
      icon: Icons.settings,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Chember and Schedule'),
          subtitle: Text('2'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Phone number'),
          subtitle: Text('01723895939'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Text('Time Per Patient'),
        Text('Appointment Request Type'),
        Text('Appointment Method'),
      ],
    );
  }
}

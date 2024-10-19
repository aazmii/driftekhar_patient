import 'package:doc_appointment/src/extensions/extensions.dart';
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
          child: Column(
            children: [
              SettingSegment(
                onSelectOption: () {},
                title: 'Account',
                icon: Icons.person,
                children: const [
                  Text('Profile'),
                  Text('Password'),
                ],
              ),
              SettingSegment(
                title: 'Appointment Setting',
                icon: Icons.settings,
                onSelectOption: () {},
                children: const [
                  Text('Phone number'),
                  Text('Time Per Patient'),
                  Text('Appointment Request Type')
                ],
              ),
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
    );
  }
}

class SettingSegment extends StatelessWidget {
  const SettingSegment({
    super.key,
    required this.children,
    this.title,
    this.icon,
    this.onSelectOption,
  });
  final List<Widget> children;
  final IconData? icon;
  final String? title;
  final VoidCallback? onSelectOption;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (title != null) ...[
                  icon != null
                      ? Icon(icon, color: context.theme.primaryColor)
                      : const SizedBox.shrink(),
                  10.toWidth,
                  Text(
                    title!,
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                  )
                ]
              ],
            ),
            10.toHeight,
            ...List.generate(
              children.length,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // InkWell(onTap: onSelectOption, child: children[index])
                  ListTile(
                    onTap: onSelectOption,
                    title: children[index],
                  ),
                  if (index < children.length - 1)
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 2,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

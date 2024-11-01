import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';

class ChemberContainer extends StatelessWidget {
  const ChemberContainer({
    super.key,
    required this.chember,
    this.onMapTapped,
    this.isSelected = false,
  });
  final bool? isSelected;
  final Chember chember;
  final VoidCallback? onMapTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected! ? 2 : 1,
          color:
              isSelected! ? context.theme.primaryColor : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chember.name ?? '',
                  style: context.text.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(chember.address ?? '', style: context.text.titleSmall),
                Text(chember.description ?? '', style: context.text.titleSmall),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              await Launcher.openMap(23.773985552744225, 90.42117791428409);
            },
            icon: const Icon(Icons.location_pin),
            label: const Text('Map'),
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({super.key, this.icon, this.text});
  final IconData? icon;
  final Widget? text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon), text ?? const SizedBox.shrink()]);
  }
}

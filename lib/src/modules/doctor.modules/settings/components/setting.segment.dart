import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

///Accepts a [List] of [Widget]s and displays them as a segmented setting
///returns tapped option name in [onSelectOption]
class SegmentedSetting extends StatelessWidget {
  const SegmentedSetting({
    super.key,
    required this.children,
    this.title,
    this.icon,
    // this.onSelectOption,
  });
  final List<Widget> children;
  final IconData? icon;
  final String? title;
  // final ValueSetter<String>? onSelectOption;
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
                    style: context.text.titleSmall!.copyWith(
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
                    onTap: () {
                      
                    },
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

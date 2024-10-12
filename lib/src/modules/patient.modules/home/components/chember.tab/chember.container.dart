import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';

class ChemberContainer extends StatelessWidget {
  const ChemberContainer({super.key, required this.chember});
  final Chember chember;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      Text(chember.address ?? '',
                          style: context.text.titleSmall),
                      Text(chember.description ?? '',
                          style: context.text.titleSmall),
                      Text(
                        'Serial : ${chember.cell?.first}',
                        style: context.text.titleSmall,
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.location_pin),
                  label: const Text('Map'),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              color: Colors.green.shade50,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.schedule_rounded),
                  5.toWidth,
                  Text(
                    'Sat, Wed - Fri : 7pm to 9pm',
                    style: context.text.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
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
    return Row(children: [Icon(icon), text ?? SizedBox.shrink()]);
  }
}

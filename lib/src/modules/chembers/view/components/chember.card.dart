import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';

class ChemberCard extends StatelessWidget {
  const ChemberCard({
    super.key,
    required this.chember,
    this.onPressed,
    this.onDelete,
    this.isSelected = false,
  });
  final VoidCallback? onPressed;
  final VoidCallback? onDelete;
  final Chember chember;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    // final roomString = chember.roomNo != null ? 'Room : ${chember.roomNo}' : '';
    // final floorString = chember.floor != null ? 'Floor : ${chember.floor}' : '';

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected! ? context.theme.primaryColor : Colors.grey,
            width: isSelected! ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                chember.name ?? '',
                style: context.text.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
            ),
            10.toHeight,
            InfoRow(
                icon: FontAwesomeIcons.locationDot,
                text: chember.address ?? 'No Address'),
            10.toHeight,
            InfoRow(
              icon: FontAwesomeIcons.userDoctor,
              title: 'Visiting',
              text: chember.firstVisitFee != null
                  ? 'TK. ${chember.firstVisitFee}'
                  : '',
            ),
            10.toHeight,
            InfoRow(
              icon: FontAwesomeIcons.arrowRotateLeft,
              title: 'Follow Up',
              text: chember.firstVisitFee != null
                  ? 'TK. ${chember.firstVisitFee}'
                  : '',
            ),
            10.toHeight,
            const Divider(color: Colors.grey),
            Center(
              child: Text(
                'Schedules',
                style: context.text.titleMedium!.copyWith(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (chember.schedules != null)
              ...List.generate(
                chember.schedules!.length,
                (i) {
                  final slots = chember.schedules![i].slots;
                  if (slots == null) return const Text('No Slots');
                  final slotStr = slots
                      .map((slot) =>
                          '${slot.start.format(context)} - ${slot.end.format(context)}')
                      .toList();

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '🗓️ ${chember.schedules![i].day} : ${slotStr.join(', ')} ',
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
    // return ListTile(
    //   trailing: onDelete != null
    //       ? IconButton(
    //           onPressed: onDelete,
    //           icon: const Icon(Icons.delete, color: Colors.red))
    //       : null,
    //   onTap: onPressed,
    //   title: Text(chember.name ?? ''), //Text(cj),
    //   subtitle: Text(chember.address ?? ''),
    // );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, this.icon, this.title, this.text = ''});
  final IconData? icon;
  final String text;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: context.theme.primaryColor,
        ),
        5.toWidth,
        if (title != null)
          Text(
            '$title : ',
            style: context.text.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.primaryColor,
            ),
          ),
        Text(
          text,
          style: context.text.titleMedium,
        ),
      ],
    );
  }
}

import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/experience/experience.dart';
import 'package:flutter/material.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({super.key, required this.experience});
  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.toHeight(),
          Text(
            experience.title ?? '-',
            style: context.text.titleMedium,
          ),
          10.toHeight(),
          Text(
            experience.institution ?? '-',
            style: context.text.titleSmall,
          ),
          10.toHeight(),
          Text(
            experience.address ?? '-',
            style: context.text.titleSmall,
          ),
          10.toHeight(),
        ],
      ),
    );
  }
}

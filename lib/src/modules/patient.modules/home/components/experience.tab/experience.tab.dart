import 'package:doc_appointment/src/modules/patient.modules/home/components/experience.tab/experience.container.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/experiences.dart';
import 'package:flutter/material.dart';

class ExperienceTab extends StatelessWidget {
  const ExperienceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        experiences.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ExperienceContainer(experience: experiences[index]),
          );
        },
      ),
    );
  }
}

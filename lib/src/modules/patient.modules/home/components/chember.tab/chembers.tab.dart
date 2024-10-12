import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:flutter/material.dart';

import 'chember.container.dart';

class ChembersTab extends StatelessWidget {
  const ChembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          chembers.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chember ${index + 1}',
                    style: context.text.titleMedium,
                  ),
                  ChemberContainer(chember: chembers[index]),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

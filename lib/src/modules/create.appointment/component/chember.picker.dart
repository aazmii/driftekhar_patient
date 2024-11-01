import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/chember.tab/chember.container.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:flutter/material.dart';

Future<Chember?> getChember(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => const Dialog(
      child: ChemberPicker(),
    ),
  );
}

class ChemberPicker extends StatelessWidget {
  const ChemberPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Text('Please select a chember', style: context.text.titleLarge),
        Expanded(
          child: ListView(
            children:
                chembers.map((e) => ChemberContainer(chember: e)).toList(),
          ),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: const RoundedRectangleBorder(),
            minimumSize: const Size.fromHeight(55),
          ),
          onPressed: () {},
          child: const Text('Select Chember'),
        ),
      ],
    );
  }
}

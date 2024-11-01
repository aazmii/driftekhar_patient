import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/chember.tab/chember.container.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

class ChembersPage extends StatelessWidget {
  const ChembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chembers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a chember',
              style: context.text.headlineSmall,
            ),
            Expanded(
              child: ListView(
                children: chembers.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () async {
                        fadePush(context, CreateAppointment(chember: e));
                      },
                      child: ChemberContainer(
                        chember: e,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

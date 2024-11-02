import 'package:doc_appointment/src/modules/create.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/chember.tab/chember.container.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

class ChembersView extends StatelessWidget {
  const ChembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: chembers.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: InkWell(
              onTap: () async {
                fadePush(context, CreateAppointment(chember: e));
              },
              child: ChemberContainer(chember: e),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/chember.tab/chember.container.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:flutter/material.dart';

class ChembersPage extends StatelessWidget {
  const ChembersPage({super.key, this.title, this.onSelectChember});
  final String? title;
  final ValueSetter<Chember>? onSelectChember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: chembers.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () => onSelectChember?.call(e),
                      // onTap: () async {
                      //   fadePush(context, CreateAppointment(chember: e));
                      // },
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

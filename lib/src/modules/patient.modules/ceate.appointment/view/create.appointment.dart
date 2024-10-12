import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/view/components/first.time.visit.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/chembers.dart';
import 'package:flutter/material.dart';

import 'components/appt.date.picker.dart';
import 'components/custom.bottom.bar.dart';
import 'components/notify.method.dart';

class CreateAppointment extends StatelessWidget {
  const CreateAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DatePicker(),
                  10.toHeight,
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Patient Name',
                          ),
                        ),
                      ),
                      10.toWidth,
                      const Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'Patient Age'),
                        ),
                      ),
                      5.toWidth,
                      const Text('Y/O'),
                    ],
                  ),
                  10.toHeight,
                  const TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Phone Number'),
                  ),
                  Text(
                    '* You will be notiied thruogh sms/email once your appointment is confirmed.',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  const NotifyMethodContainer(),
                  10.toHeight,
                  const Text('Select one of the chember'),
                  const ChemberListview(),
                  10.toHeight,
                  const FirstTimeVisit(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}

class ChemberListview extends StatelessWidget {
  const ChemberListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(
            chembers.length,
            (index) => Container(
              width: context.width * 0.55,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      chembers[index].name ?? '-',
                      style: context.text.titleSmall!.copyWith(fontSize: 12),
                    ),
                    Text(
                      chembers[index].address ?? '-',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

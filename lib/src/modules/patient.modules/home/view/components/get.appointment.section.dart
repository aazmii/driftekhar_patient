import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

class GetAppointSection extends StatelessWidget {
  const GetAppointSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience ',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text('38 years'),
              Text(
                'Working place',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text('Ibn Sina D. LAB Malibagh'),
            ],
          ),
          ElevatedButton(
            onPressed: () async =>
                await fadePush(context, const CreateAppointment()),
            child: const Text('Get Appointment'),
          )
        ],
      ),
    );
  }
}

import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/doctor.modules/home/view/doctor.home.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/view/patient.home.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: context.height * 0.1),
            Text(
              'Dr. Md. Iftekhar Alam',
              style: context.text.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
              ),
            ),
            SizedBox(height: context.height * 0.5),
            ElevatedButton(
              onPressed: () async => fadePush(context, const DoctorHome()),
              child: const Text('View as Doctor'),
            ),
            ElevatedButton(
              onPressed: () async => fadePush(context, const PatientHome()),
              child: const Text('View as Patient'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/home/components/drawer.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/chember.tab/chembers.tab.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/experience.tab/experience.tab.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/view/components/tab.bar.dart';
import 'package:flutter/material.dart';

import '../components/review.tab/review.tab.dart';
import '../models/tab.model.dart';
import 'components/doc.image.with.profession.dart';
import 'components/get.appointment.section.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const ImageWithProfessionWidget(),
          10.toHeight(),
          const GetAppointSection(),
          Expanded(
            child: TabBarWidget(
              tabs: [
                TabModel(title: 'Chembers', child: const ChembersTab()),
                TabModel(title: 'Experiences', child: const ExperienceTab()),
                TabModel(title: 'Review', child: const ReviewTab()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

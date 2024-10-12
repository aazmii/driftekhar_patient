import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/chember.tab/chembers.tab.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/experience.tab/experience.tab.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

import '../components/review.tab/review.tab.dart';
import 'components/doc.image.with.profession.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              expandedHeight: 320,
              flexibleSpace: const ImageWithProfessionWidget(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                    unselectedLabelStyle: const TextStyle(),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: context.theme.primaryColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    tabs: 'Chembers,Experiences,Review'
                        .split(',')
                        .toList()
                        .map((str) => Tab(child: Text(str)))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 400,
                  child: TabBarView(
                    children: [
                      ChembersTab(),
                      ExperienceTab(),
                      ReviewTab(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Dr. Mohammad Iftekhar Alam',
                    style: context.text.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(aboutMeText),
                ),
                10.toHeight,
              ],
            ),
          ),
        ),
        floatingActionButton: FilledButton(
          style: FilledButton.styleFrom(
            minimumSize: const Size(150, 50),
            backgroundColor: Colors.grey.shade900,
            foregroundColor: Colors.blue,
            side: const BorderSide(color: Colors.blue, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () async => await fadePush(
            context,
            const CreateAppointment(),
          ),
          child: const Text('Appointment'),
        ),
      ),
    );
  }
}

final aboutMeText =
    'I am a fully trained British Consultant General, Laparoscopic and Vascular Surgeon. I have 38 years of experience in General, Vascular and laparoscopic Surgery in the UK and obtained my complete British training in London, Leeds, Hull, Bristol, Gloucester and Bath. I have been a Consultant General, Vascular and laparoscopic Surgeon in the UK for the last 18 years after completing 17 years of training . I am registered with the General Medical Council UK as a Consultant General and Vascular Surgeon.';

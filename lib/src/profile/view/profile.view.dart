import 'package:driftekhar_patient/src/constants/doc.contants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180.0),
          child: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(20, 90, 10, 10),
              child: Row(
                children: [
                  Hero(
                    tag: 'assets/icons/app.icon.png',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        height: 240,
                        width: 80,
                        fit: BoxFit.cover,
                        'assets/icons/app.icon.png',
                      ),
                    ),
                  ),
                  10.toWidth,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        docName,
                        style: context.text.titleLarge,
                      ),
                      const Text(docSpeciality),
                      10.toHeight,
                      const Text(
                        'Experience',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      // 5.toHeight,
                      Text('7+ years', style: context.text.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Experience'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [About(), Experience()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '''I am a fully trained British Consultant General, Laparoscopic and Vascular Surgeon. I have 38 years of experience in General, Vascular and laparoscopic Surgery in the UK and obtained my complete British training in London, Leeds, Hull, Bristol, Gloucester and Bath. I have been a Consultant General, Vascular and laparoscopic Surgeon in the UK for the last 18 years after completing 17 years of training . I am registered with the General Medical Council UK as a Consultant General and Vascular Surgeon.

Orthopedic & Trauma Surgeon
MBBS (Dhaka), D-Ortho (BSMMU)
AO Basic Tauma (Ao Foundation
Member of American Academy of Orthopedics Surgeon
Assistant Propessor (Dept. of Orthopaedics)
Ad-din Women’s Medical College Hospital, Dhaka.

          ''',
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: List.generate(5, (index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: Text(
                      'Shaheed Suhrawardi Madical College Hospital',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'Designation',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Text('Assistant Surgon'),
                  10.toHeight,
                  const Text(
                    'Department',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Text('General Surgery'),
                  10.toHeight,
                  const Text(
                    'Duration',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Text('2021-2022'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

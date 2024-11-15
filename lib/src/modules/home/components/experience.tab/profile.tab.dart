import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/components/experience.tab/experience.container.dart';
import 'package:driftekhar_patient/src/modules/home/providers/experiences.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            experiences.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExperienceContainer(experience: experiences[index]),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Dr. Mohammad Iftekhar Alam',
              style: context.text.titleLarge!.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(aboutMeText),
          ),
          10.toHeight,
        ],
      ),
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisSize: MainAxisSize.min,
    //   children: List.generate(
    //     experiences.length,
    //     (index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ExperienceContainer(experience: experiences[index]),
    //       );
    //     },
    //   ),
    // );
  }
}

const aboutMeText =
    'I am a fully trained British Consultant General, Laparoscopic and Vascular Surgeon. I have 38 years of experience in General, Vascular and laparoscopic Surgery in the UK and obtained my complete British training in London, Leeds, Hull, Bristol, Gloucester and Bath. I have been a Consultant General, Vascular and laparoscopic Surgeon in the UK for the last 18 years after completing 17 years of training . I am registered with the General Medical Council UK as a Consultant General and Vascular Surgeon.';

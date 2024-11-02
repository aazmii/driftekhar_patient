import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/patient.modules/chembers/view/chembers.page.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/models/welcome.options.dart';
import 'package:doc_appointment/src/modules/patient.modules/online.consultation/view/online.consultation.dart';
import 'package:doc_appointment/src/modules/patient.modules/services/view/services.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/home.container/home.container.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    final int crossAxisCount = context.width > 600 ? 4 : 2;
    return Scaffold(
      // endDrawer: const AppDrawer(),

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: Colors.blue.shade50,
                height: 150,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset(
                    'assets/images/png/logo.png',
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                child: SizedBox(
                  width: context.width,
                  child: const CircleAvatar(radius: 50),
                ),
              ),
            ],
          ),
          60.toHeight,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dr. Md. Iftekhar Alam',
                style: context.text.titleMedium!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              Text(
                'Orthopedic & Trauma Surgeon ​',
                style: context.text.titleLarge,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () async => handleRoute(context, index),
                    child: HomeContainer(
                      option: _welcomeOptions[index],
                    ),
                  );
                },
                itemCount: _welcomeOptions.length,
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const PayAndConfimButton(),
      floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors.green,
            size: 34,
          )),
    );
  }

  handleRoute(BuildContext context, int index) async {
    final service = _welcomeOptions[index].title;

    if (service == 'Book Appointment') {
      await fadePush(
        context,
        ChembersPage(
          title: 'Select Chember',
          onSelectChember: (chember) async => fadePush(
            context,
            CreateAppointment(
              chember: chember,
            ),
          ),
        ),
      );
    }
    if (service == 'Online Consultation') {
      await fadePush(context, OnlineConsultationPage());
    }
    if (service == 'Chembers') {
      await fadePush(context, const ChembersPage(title: 'Chembers'));
    }
    if (service == 'Services') {
      await fadePush(context, const ServicesPage());
    }
  }
}

final _welcomeOptions = [
  WelcomeOption(
    title: 'Book Appointment',
    image: 'assets/images/png/book.appointment.png',
  ),
  WelcomeOption(
    title: 'Online Consultation',
    image: 'assets/images/png/online.appointment.png',
  ),
  WelcomeOption(
    title: 'Services',
    image: 'assets/images/jpg/injuries.jpg',
  ),
  WelcomeOption(
    title: 'Chembers',
    image: 'assets/images/jpg/consult.jpg',
  ),
];

import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/components/custom.bottom.bar.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/models/welcome.options.dart';
import 'package:doc_appointment/src/modules/patient.modules/services/view/services.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

import '../../components/home.container/home.container.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: const AppDrawer(),

      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/images/jpg/doc.jpg'),
                    fit: BoxFit.cover,
                    // image: NetworkImage(imageLInk),
                  ),
                ),
                Positioned(
                  bottom: -60,
                  child: SizedBox(
                    width: context.width,
                    child: const CircleAvatar(radius: 60),
                  ),
                ),
              ],
            ),
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
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, index) => InkWell(
                      onTap: () async {
                        if (welcomeOptions[index].title == 'Services') {
                          await fadePush(context, const ServicesPage());
                        }
                      },
                      child: HomeContainer(
                        option: welcomeOptions[index],
                      ),
                    ),
                itemCount: welcomeOptions.length),
          ),
          // const SizedBox(height: 70),
        ],
      ),
      bottomNavigationBar: const PayAndConfimButton(),
    );
  }
}

final welcomeOptions = [
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

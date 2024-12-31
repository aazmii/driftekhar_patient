import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/components/social.icons.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'components/book.appt.button.dart';
import 'components/grid.container.dart';
import 'components/surgon.carousel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold(body: SurgonCarousel()),
        Scaffold(
          // endDrawer: const AppDrawer(),

          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    color: primaryColor,
                    height: context.height * 0.3,
                    child: SurgonCarousel(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Image.asset(
                        'assets/images/png/dr.iftekhar.png',
                        color: Colors.white,
                        // 'assets/images/png/logo.png',
                        height: context.width * 0.12,
                      ),
                    ),
                  ),
                  // if (context.isTabletWidth)
                  Positioned(
                    bottom: context.isTabletWidth ? 0 : -40,
                    right: 0,
                    child: const SocialIcons(),
                  ),
                  Positioned(
                    // top: 8,
                    bottom: -50,
                    left: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/icons/app.icon.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: context.isTabletWidth ? -80 : -130,
                    left: context.isTabletWidth ? 120 : 10,
                    // bottom: -80,
                    // left: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Asst Prof. Dr. Mohammad Iftekhar Alam',
                          style: context.isTabletWidth
                              ? context.text.titleLarge!.copyWith(
                                  color: context.theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                )
                              : context.text.titleMedium!.copyWith(
                                  color: context.theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                        Text(
                          'Assistant Professor (Orthopaedic Surgery)​',
                          style: context.text.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          'Dr.Sirajul Islam Medical College,Dhaka.​',
                          style: context.text.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              context.isTabletWidth ? 80.toHeight : 150.toHeight,
              // SizedBox(
              //   width: context.width * 0.9,
              //   child: ScrollingText(
              //       height: 50,
              //       text:
              //           'পেশেন্টদের ডায়াগনোসিস করে রোগ নির্ণয় করতে হয় ।প্রাথমিক ডায়াগনোসিস, রিপোর্ট দেখানো, প্রেসক্রিপশন সহ নানান সুবিধা উপভোগ করুন অল্প সময়ে, অল্প খরচে ',
              //       textStyle: context.text.titleLarge!.copyWith(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.grey.shade800,
              //       )),
              // ),
              // Text(
              //   'Welcome!',
              //   style: context.text.titleLarge!.copyWith(
              //     color: context.theme.primaryColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              BookApptButton(
                onPressed: () =>
                    Navigator.pushNamed(context, homeGridItems.first.routeName),
              ),
              5.toHeight,
              const Text(
                'Tap for appointment',
                style: TextStyle(color: Colors.grey),
              ),
              20.toHeight,
              Expanded(
                child: Wrap(
                  runSpacing: 20,
                  spacing: 10,
                  children: List.generate(
                    homeGridItems.length,
                    (index) {
                      // print('list ${homeGridItems[index]}');
                      return GridContainer(
                        gridItem: homeGridItems[index],
                        onTap: () => Navigator.pushNamed(
                            context, homeGridItems[index].routeName),
                      );
                    },
                  ),
                ),
              ),
              // Flexible(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Consumer(
              //       builder: (context, ref, child) {
              //         return context.isTabletWidth
              //             ? Wrap(
              //                 runSpacing: 10,
              //                 spacing: 10,
              //                 children: List.generate(
              //                   homeGridItems.length,
              //                   (index) {
              //                     // print('list ${homeGridItems[index]}');
              //                     return GridContainer(
              //                       gridItem: homeGridItems[index],
              //                       onTap: () => Navigator.pushNamed(context,
              //                           homeGridItems[index].routeName),
              //                     );
              //                   },
              //                 ),
              //               )
              //             : Align(
              //                 child: GridView.builder(
              //                   shrinkWrap: true,
              //                   gridDelegate:
              //                       const SliverGridDelegateWithFixedCrossAxisCount(
              //                           crossAxisCount: 3),
              //                   itemBuilder: (_, index) {
              //                     return GridContainer(
              //                       onTap: () async {
              //                         // print(homeGridItems[index].routeName);
              //                         Navigator.pushNamed(context,
              //                             homeGridItems[index].routeName);
              //                       },
              //                       gridItem: GridItem(
              //                         imagePath: homeGridItems[index].imagePath,
              //                         title: homeGridItems[index].title,
              //                         routeName: homeGridItems[index].routeName,
              //                       ),
              //                     );
              //                   },
              //                   itemCount: homeGridItems.length,
              //                 ),
              //               );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
          // bottomNavigationBar: const PayAndConfimButton(),
          floatingActionButton: Consumer(builder: (context, ref, child) {
            return IconButton(
              onPressed: () async {
                // const token =
                //     'fYjLxJG5Q9a0oMvld1dMO2:APA91bHHiITYf2yQ-53u8Ierq7htr1kpKpgnbhNiAfs33oukUgWDFVtWgpXlZJlGZCfAUpoU6wkQFK4VGRN2SsdT3-ZGvqnLKyKTRxeMIEuZcq86TXtIRDw';
                // NotificationService.instance.sendNotificationToDevice(
                //     token, 'Patient App', 'Patient app body');
              },
              icon: SvgPicture.asset(
                'assets/icons/whatsapp.svg',
                height: 44,
              ),
            );
          }),
        ),
      ],
    );
  }
}

final homeGridItems = [
  GridItem(
    title: 'Book\nAppointment',
    imagePath: 'assets/images/png/book.appointment.png',
    routeName: chemberSelectionRoute,
  ),
  GridItem(
    title: 'Online\nConsultation',
    // image: 'assets/images/png/online.consult.png',
    imagePath: 'assets/images/png/online.appointment.png',
    routeName: onlineConsultationRoute,
  ),
  GridItem(
    title: 'Services',
    imagePath: 'assets/images/png/medical.kit.png',
    routeName: servicesRoute,
  ),
  GridItem(
    title: 'Chembers',
    imagePath: 'assets/images/png/consult.png',
    routeName: chemberSelectionRoute,
  ),
  GridItem(
    title: 'Socials',
    imagePath: 'assets/images/png/socials.png',
    routeName: socialsRoute,
  ),
];

class CarouseBackground extends StatelessWidget {
  const CarouseBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

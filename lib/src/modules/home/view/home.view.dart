import 'package:cached_network_image/cached_network_image.dart';
import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/components/social.icons.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:driftekhar_patient/src/services/notification.service/nofication.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'components/grid.container.dart';
import 'components/surgon.carousel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    // final int crossAxisCount = context.width > 600 ? 4 : 2;
    // return Scaffold(
    //   body: Image.asset('assets/images/jpg/surgery4.jpg'),
    // );
    return Stack(
      children: [
        // Scaffold(body: SurgonCarousel()),
        Scaffold(
          // endDrawer: const AppDrawer(),

          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                // alignment: Alignment.topCenter,
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
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://driftekharalam.com/wp-content/uploads/2024/09/IF.png',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
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
              context.isTabletWidth ? 80.toHeight : 120.toHeight,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer(builder: (context, ref, child) {
                    return context.isTabletWidth
                        ? Wrap(
                            runSpacing: 10,
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
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            // gridDelegate:
                            //     SliverGridDelegateWithFixedCrossAxisCount(
                            //   crossAxisCount: crossAxisCount,
                            //   mainAxisSpacing: 30,
                            //   crossAxisSpacing: 10,
                            // ),
                            itemBuilder: (_, index) {
                              return GridContainer(
                                onTap: () async {
                                  // print(homeGridItems[index].routeName);
                                  Navigator.pushNamed(
                                      context, homeGridItems[index].routeName);
                                },
                                gridItem: GridItem(
                                  imagePath: homeGridItems[index].imagePath,
                                  title: homeGridItems[index].title,
                                  routeName: homeGridItems[index].routeName,
                                ),
                              );
                            },
                            itemCount: homeGridItems.length,
                          );
                  }),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: const PayAndConfimButton(),
          floatingActionButton: IconButton(
            onPressed: () {
              const token =
                  'fYjLxJG5Q9a0oMvld1dMO2:APA91bHHiITYf2yQ-53u8Ierq7htr1kpKpgnbhNiAfs33oukUgWDFVtWgpXlZJlGZCfAUpoU6wkQFK4VGRN2SsdT3-ZGvqnLKyKTRxeMIEuZcq86TXtIRDw';
              NotificationService.instance.sendNotificationToDevice(
                  token, 'Patient App', 'Patient app body');
            },
            icon: SvgPicture.asset(
              'assets/icons/whatsapp.svg',
              height: 44,
            ),
            // icon: const Icon(
            //   FontAwesomeIcons.whatsapp,
            //   color: Colors.green,
            //   size: 34,
            // ),
          ),
        ),
      ],
    );
  }

  // handleRoute(BuildContext context, int index, WidgetRef ref) async {
  //   final service = _welcomeOptions[index].title;

  //   if (service == 'Book Appointment') {
  //     await fadePush(
  //       context,
  //       ChembersView(
  //         title: 'Select Chember',
  //         onSelectChember: (chember) async {
  //           // print(
  //           //     'before ${ref.read(selectedChemberProvider)?.name}'); // Before updating
  //           // ref.read(selectedChemberProvider.notifier).update(chember);
  //           // print(
  //           //     'after ${ref.read(selectedChemberProvider)?.name}'); // After updating
  //           ref.read(selectedChemberProvider.notifier).update(chember);

  //           await fadePush(
  //             context,
  //             const CreateAppointmentView(),
  //           );
  //         },
  //       ),
  //     );
  //   }
  //   if (service == 'Online Consultation') {
  //     await fadePush(context, const OnlineConsultationPage());
  //   }
  //   if (service == 'Chembers') {
  //     await fadePush(context, const ChembersView(title: 'Chembers'));
  //   }
  //   if (service == 'Services') {
  //     await fadePush(context, const ServicesPage());
  //   }
  // }
}

final homeGridItems = [
  GridItem(
    title: 'Book Appointment',
    imagePath: 'assets/images/png/book.appointment.png',
    routeName: chembersRoute,
  ),
  GridItem(
    title: 'Online Consultation',
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
    routeName: chembersRoute,
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

import 'package:driftekhar_patient/src/constants/constants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/components/social.icons.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/auto.scroll.text.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:driftekhar_patient/src/utils/user.data.init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'components/book.appt.button.dart';
import 'components/grid.container.dart';
import 'components/surgon.carousel.dart';
import 'components/waiting.screen.dart';
import 'components/yt.video.list.dart';

class HomeViewNew extends StatelessWidget {
  const HomeViewNew({super.key});
  static const String route = '/';
  final textScrollSpeed = 70.0;
  @override
  Widget build(BuildContext context) {
    // return WaitingScreen();
    return Scaffold(
      // endDrawer: const AppDrawer(),
      body: FutureBuilder(
          future: initUserData(),
          builder: (_, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const WaitingScreen()
                : Column(
                    children: [
                      const CoverSection(),
                      context.isTabletWidth ? 80.toHeight : 140.toHeight,
                      const Divider(),
                      SizedBox(
                        width: context.width * 0.9,
                        child: ScrollingText(
                          height: 30,
                          speed: textScrollSpeed,
                          text:
                              'পেশেন্টদের ডায়াগনোসিস করে রোগ নির্ণয় করতে হয়। প্রাথমিক ডায়াগনোসিস, রিপোর্ট দেখানো, প্রেসক্রিপশন সহ নানান সুবিধা উপভোগ করুন অল্প সময়ে, অল্প খরচে ডায়াগনোসিস করুন অল্প সময়ে।',
                          textStyle: context.text.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      10.toHeight,
                      BookApptButton(
                        onPressed: () => Navigator.pushNamed(
                            context, homeOptions.first.routeName),
                      ),
                      20.toHeight,
                      //---- OPTIONS
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              homeOptions.length,
                              (index) {
                                // print('list ${homeOptions[index]}');
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: GridContainer(
                                    gridItem: homeOptions[index],
                                    onTap: () => Navigator.pushNamed(
                                        context, homeOptions[index].routeName),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      20.toHeight,
                      //---- YOUTUBE VIDEOS
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Popular on youtube',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        child: YtVideoList(),
                      ),
                    ],
                  );
          }),
      // body:
      // bottomNavigationBar: const PayAndConfimButton(),
      floatingActionButton: Consumer(builder: (context, ref, child) {
        return IconButton(
          onPressed: () async => await Launcher.openWhatsApp(whastsappNumber),
          icon: SvgPicture.asset(
            'assets/icons/whatsapp.svg',
            height: 44,
          ),
        );
      }),
    );
  }
}

class CoverSection extends StatelessWidget {
  const CoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: SafeArea(
              child: Image.asset(
                'assets/images/png/dr.iftekhar.png',
                color: Colors.white,
                // 'assets/images/png/logo.png',
                height: context.width * 0.12,
              ),
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
    );
  }
}

final homeOptions = [
  GridItem(
    title: 'Book\nAppointment',
    imagePath: 'assets/images/png/book.appointment.png',
    routeName: chemberSelectionRoute,
  ),
  // GridItem(
  //   title: 'Online\nConsultation',
  // image: 'assets/images/png/online.consult.png',
  //   imagePath: 'assets/images/png/online.appointment.png',
  //   routeName: onlineConsultationRoute,
  // ),
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

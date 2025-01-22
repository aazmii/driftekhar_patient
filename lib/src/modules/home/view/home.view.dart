import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/cover.section.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'components/book.appt.button.dart';
import 'components/drawer.dart';
import 'components/grid.container.dart';
import 'components/nav.bar.dart';
import 'components/yt.video.list.dart';

final GlobalKey<ScaffoldState> homeViewScaffoldKey = GlobalKey();

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String route = '/';
  final textScrollSpeed = 70.0;
  @override
  Widget build(BuildContext context) {
    // return WaitingScreen();
    return Scaffold(
      key: homeViewScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(flex: 2, child: CoverSection()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Asst Prof. Dr. Mohammad Iftekhar Alam',
                        style: context.isTabletWidth
                            ? context.text.titleLarge!.copyWith(
                                color: context.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              )
                            : context.text.titleMedium!.copyWith(
                                color: context.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Assistant Professor (Orthopaedic Surgery)​',
                        style: context.text.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dr.Sirajul Islam Medical College,Dhaka.​',
                        style: context.text.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    const Divider(),

                    // SizedBox(
                    //   width: context.width * 0.9,
                    //   child: ScrollingText(
                    //     height: 30,
                    //     speed: textScrollSpeed,
                    //     text:
                    //         'পেশেন্টদের ডায়াগনোসিস করে রোগ নির্ণয় করতে হয়। প্রাথমিক ডায়াগনোসিস, রিপোর্ট দেখানো, প্রেসক্রিপশন সহ নানান সুবিধা উপভোগ করুন অল্প সময়ে, অল্প খরচে ডায়াগনোসিস করুন অল্প সময়ে।',
                    //     textStyle: context.text.titleSmall!.copyWith(
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.grey.shade800,
                    //     ),
                    //   ),
                    // ),
                    10.toHeight,
                    BookApptButton(
                      onPressed: () async {
                        Navigator.pushNamed(
                            context, _homeOptions.first.routeName);
                      },
                    ),
                    20.toHeight,
                    // //---- OPTIONS
                    SizedBox(
                      height: 120,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            _homeOptions.length,
                            (index) {
                              // print('list ${_homeOptions[index]}');
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GridContainer(
                                  gridItem: _homeOptions[index],
                                  onTap: () => Navigator.pushNamed(
                                      context, _homeOptions[index].routeName),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    20.toHeight,
                    // //---- YOUTUBE VIDEOS
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular on youtube',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                      child: YtVideoList(),
                    ),
                    5.toHeight,
                    // Padding(
                    //   padding: const EdgeInsets.all(0.0),
                    //   child: FoatingNavBar(),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

final _homeOptions = [
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
    routeName: chemberViewRoute,
  ),
  GridItem(
    title: 'Socials',
    imagePath: 'assets/images/png/socials.png',
    routeName: socialsRoute,
  ),
];

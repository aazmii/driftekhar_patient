import 'package:driftekhar_patient/src/constants/doc.contants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/nav.bar.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/social.container.dart';
import 'package:driftekhar_patient/src/modules/home/view/components/speed.dial.button.dart';
import 'package:driftekhar_patient/src/routes/routes.dart';
import 'package:driftekhar_patient/src/utils/url.launcher/url.launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/drawer.dart';
import 'components/grid.container.dart';
import 'components/surgon.carousel.dart';
import 'components/yt.video.list.dart';

final GlobalKey<ScaffoldState> homeViewScaffoldKey = GlobalKey();

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String route = '/';
  final textScrollSpeed = 70.0;
  @override
  Widget build(BuildContext context) {
    final carouselHeight = context.height * 0.32;
    // return WaitingScreen();
    return Scaffold(
      key: homeViewScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const CoverSection(),
              SizedBox(
                height: carouselHeight,
                child: ColoredBox(
                  color: context.theme.primaryColor,
                  child: SurgonCarousel(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.toHeight,
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
                        10.toHeight,
                        const Divider(),
                        10.toHeight,
                        const Text(
                          'Services: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        5.toHeight,
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
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GridContainer(
                                      gridItem: _homeOptions[index],
                                      onTap: () => Navigator.pushNamed(context, _homeOptions[index].routeName),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        20.toHeight,
                        const Text(
                          'Social: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        5.toHeight,
                        SizedBox(
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              SocialContainer(
                                icon: Icons.facebook,
                                title: 'Facebook',
                                followers: '32K',
                                iconPath: 'assets/icons/facebook.svg',
                                onTap: () async => await Launcher.browseLink(facebookLink),
                              ),
                              SocialContainer(
                                icon: FontAwesomeIcons.youtube,
                                followers: '12.1k',
                                title: 'Youtube',
                                iconPath: 'assets/icons/youtube.svg',
                                onTap: () async => await Launcher.browseLink(youtubeLink),
                              ),
                              SocialContainer(
                                icon: Icons.tiktok,
                                title: 'TickTok',
                                iconPath: 'assets/icons/tiktok.svg',
                                followers: '21.9k',
                                onTap: () async => await Launcher.browseLink(tiktokLink),
                              ),
                            ],
                          ),
                        ),
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
                        30.toHeight,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.06),
            child: Image.asset(
              'assets/images/png/dr.iftekhar.png',
              color: Colors.white,
              height: context.width * 0.12,
            ),
          ),
          Positioned(
            top: carouselHeight - 50,
            left: 10,
            child: Hero(
              tag: 'assets/icons/app.icon.png',
              child: CircleAvatar(
                // backgroundColor: context.theme.primaryColor,
                radius: 52,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/icons/app.icon.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const SpeedDialButton(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

final _homeOptions = [
  GridItem(
    title: 'Book Appointment',
    imagePath: 'assets/images/png/book.appointment.png',
    routeName: chemberSelectionRoute,
  ),
  GridItem(
    title: 'Services',
    imagePath: 'assets/images/png/joints.png',
    routeName: servicesRoute,
  ),
  GridItem(
    title: 'Chembers',
    imagePath: 'assets/images/png/consult.png',
    routeName: chemberViewRoute,
  ),
];

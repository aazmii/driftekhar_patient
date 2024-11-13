import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_appointment/src/constants/constants.dart';
import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/chembers/view/chembers.page.dart';
import 'package:doc_appointment/src/modules/home/components/social.icons.dart';
import 'package:doc_appointment/src/modules/home/models/welcome.options.dart';
import 'package:doc_appointment/src/modules/online.consultation/view/online.consultation.dart';
import 'package:doc_appointment/src/modules/home/components/services/view/services.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/home.container/home.container.dart';
import 'components/surgon.carousel.dart';

class PatientHome3 extends StatelessWidget {
  const PatientHome3({super.key});

  @override
  Widget build(BuildContext context) {
    final int crossAxisCount = context.width > 600 ? 4 : 2;
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
                    height: 120,
                    child: SurgonCarousel(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Image.asset(
                        'assets/images/png/dr.iftekhar.png',
                        color: Colors.white,
                        // 'assets/images/png/logo.png',
                        height: 40,
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
      await fadePush(context, const OnlineConsultationPage());
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
    // image: 'assets/images/png/online.consult.png',
    image: 'assets/images/png/online.appointment.png',
  ),
  WelcomeOption(
    title: 'Services',
    image: 'assets/images/png/medical.kit.png',
  ),
  WelcomeOption(
    title: 'Chembers',
    image: 'assets/images/png/consult.png',
  ),
  WelcomeOption(
    title: 'Socials',
    image: 'assets/images/png/socials.png',
  ),
];

class CarouseBackground extends StatelessWidget {
  const CarouseBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

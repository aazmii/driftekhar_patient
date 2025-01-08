import 'package:driftekhar_patient/src/modules/chembers/view/chember.view.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/view/book.appointment.view.dart';
import 'package:driftekhar_patient/src/modules/home/view/home.view.dart';
import 'package:driftekhar_patient/src/modules/online.consultation/view/online.consultation.dart';
import 'package:driftekhar_patient/src/modules/social.link.page/view/view.dart';

import '../modules/chembers/view/chember.selection.view.dart';
import '../modules/services/view/services.dart';

const String homeRoute = "/home";
const String bookAppointmentRoute = "/book_appointment";
// const String upcomingApptRoute = "/upcoming_appointment";
const String onlineConsultationRoute = "/consultation";
const String servicesRoute = "/services";

const String chemberViewRoute = "/chembers";
const String chemberSelectionRoute = "/chembers_selection";
const String socialsRoute = "/socials";

final routesMap = {
  // '/': (context) => const HomeView(),
  homeRoute: (context) => const HomeView(),
  bookAppointmentRoute: (context) => const BookAppointmentView(),
  onlineConsultationRoute: (context) => const OnlineConsultationPage(),
  servicesRoute: (context) => const ServicesPage(),
  chemberViewRoute: (context) => const ChembersView(),
  chemberSelectionRoute: (context) => const ChemberSelectionView(),
  socialsRoute: (context) => const SocialLinksView()
};

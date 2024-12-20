import 'package:driftekhar_patient/src/modules/create.appointment/view/create.appointment.view.dart';
import 'package:driftekhar_patient/src/modules/home/view/home.view.dart';
import 'package:driftekhar_patient/src/modules/online.consultation/view/online.consultation.dart';
import 'package:flutter/material.dart';

import '../modules/chembers/view/chembers.view.dart';
import '../modules/home/components/services/view/services.dart';

const String homeRoute = "/home";
const String bookAppointmentRoute = "/book_appointment";
// const String upcomingApptRoute = "/upcoming_appointment";
const String onlineConsultationRoute = "/consultation";
const String servicesRoute = "/services";
const String chembersRoute = "/chembers";
const String socialsRoute = "/socials";

final routesMap = {
  // '/': (context) => const HomeView(),
  homeRoute: (context) => const HomeView(),
  bookAppointmentRoute: (context) => const CreateAppointmentView(),
  onlineConsultationRoute: (context) => const OnlineConsultationPage(),
  servicesRoute: (context) => const ServicesPage(),
  chembersRoute: (context) => const ChembersView(),
  socialsRoute: (context) => Scaffold(appBar: AppBar()),
};

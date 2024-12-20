import 'package:driftekhar_patient/src/constants/route.names.dart';
import 'package:driftekhar_patient/src/modules/chembers/view/chembers.view.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/view/create.appointment.view.dart';
import 'package:driftekhar_patient/src/modules/home/components/services/view/services.dart';
import 'package:driftekhar_patient/src/modules/online.consultation/view/online.consultation.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  //  final arguments = settings.arguments;
  switch (settings.name) {
    case bookAppointmentRoute:
      return MaterialPageRoute(
        builder: (context) => const CreateAppointmentView(),
      );
    case onlineConsultationRoute:
      return MaterialPageRoute(
        builder: (context) => const OnlineConsultationPage(),
      );
    case chembersRoute:
      return MaterialPageRoute(
        builder: (context) => const ChembersView(),
      );

    case servicesRoute:
      return MaterialPageRoute(
        builder: (context) => const ServicesPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}

import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/create.appointment.dart';
import 'package:doc_appointment/src/modules/create.appointment/view/components/custom.bottom.bar.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/components/experience.tab/profile.tab.dart';
import 'package:flutter/material.dart';

import 'components/doc.image.with.profession.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: const AppDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 260,
              flexibleSpace: ImageWithProfessionWidget(),
            ),
          ],
          body: Column(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                  unselectedLabelStyle: const TextStyle(),
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: context.theme.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  tabs: 'Appointment,Doctor Profile'
                      .split(',')
                      .toList()
                      .map((str) => Tab(child: Text(str)))
                      .toList(),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [CreateAppointment(), ProfileTab()],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const PayAndConfimButton(),
    );
  }
}

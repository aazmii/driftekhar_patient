import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/gen/assets.gen.dart';
import 'package:doc_appointment/src/modules/doctor.modules/home/view/doctor.home.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/view/patient.home.3.dart';
import 'package:doc_appointment/src/modules/router/provider/route.provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward(); // Starts the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Dr. Md. Iftekhar Alam',
                style: context.text.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Assets.images.png.medicine.image(height: 140),
                  );
                },
              ),
              Column(
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(55),
                    ),
                    onPressed: () async => fadePush(context, const DoctorApp()),
                    child: const Text('View as Doctor'),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(55),
                    ),
                    onPressed: () async => fadePush(
                      context,
                      const PatientHome3(),
                    ),
                    child: const Text('View as Patient'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

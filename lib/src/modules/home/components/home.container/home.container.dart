import 'dart:ui';

import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/welcome.options.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.option});
  final WelcomeOption option;

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
      width: 100.0,
      height: 100.0,
      borderColor: context.theme.primaryColor,
      borderWidth: 2,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(
                  option.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              option.title,
              textAlign: TextAlign.center,
              style: context.text.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({
    super.key,
    this.width,
    this.height,
    this.borderColor,
    this.borderWidth,
    required this.child,
  });

  final double? width;
  final double? height;
  final Widget child;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          //we use Stack(); because we want the effects be on top of each other,
          //  just like layer in photoshop.
          child: Stack(
            children: [
              //blur effect ==> the third layer of stack
              BackdropFilter(
                filter: ImageFilter.blur(
                  //sigmaX is the Horizontal blur
                  sigmaX: 4.0,
                  //sigmaY is the Vertical blur
                  sigmaY: 10.0,
                ),
                //we use this container to scale up the blur effect to fit its
                //  parent, without this container the blur effect doesn't appear.
                child: Container(),
              ),
              //gradient effect ==> the second layer of stack
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),

                  border: borderWidth == null
                      ? null
                      : Border.all(
                          color: borderColor!,
                          width: borderWidth ?? 1,
                          // color: context.theme.primaryColor,
                          // width: 2,
                        ),

                  // border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //begin color
                        Colors.white.withOpacity(0.15),
                        //end color
                        Colors.white.withOpacity(0.05),
                      ]),
                ),
              ),
              //child ==> the first/top layer of stack
              Center(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SurgonCarousel extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/jpg/surgery1.jpg',
    'assets/images/jpg/surgery2.jpg',
    'assets/images/jpg/surgery3.jpg',
    'assets/images/jpg/surgery4.jpg',
  ];

  SurgonCarousel({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        autoPlay: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.7,
                  image: AssetImage(path),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

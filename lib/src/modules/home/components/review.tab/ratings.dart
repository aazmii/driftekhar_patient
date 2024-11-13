import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    super.key,
    required this.rating,
    this.total = 5,
    this.iconSize = 14,
  }) : assert(rating >= 0 && rating <= 5);
  final double? iconSize;
  final int rating;
  final int? total;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: getStars);
  }

  List<Widget> get getStars {
    List<Widget> stars = [];
    for (var i = 0; i < total!; i++) {
      stars.add(Icon(
        size: iconSize,
        Icons.star,
        color: i < rating ? Colors.amber : Colors.grey,
      ));
    }
    return stars;
  }
}

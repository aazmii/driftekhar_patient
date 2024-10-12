import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'ratings.dart';

class ReviewSummary extends StatelessWidget {
  const ReviewSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                '4.8',
                style: context.text.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Ratings(rating: 4),
              const Text(
                '(3.5k Reviews)',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: ReviewDetail(),
        ),
      ],
    );
  }
}

class ReviewDetail extends StatelessWidget {
  ReviewDetail({super.key});
  final ratingRates = <double>[70.4, 56.3, 34.6, 11.0, 9.6];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        ratingRates.length,
        (index) => DetailTile(
          index: ratingRates.length - index,
          ratingPercentage: ratingRates[index],
        ),
      ).toList(),
    );
  }
}

class DetailTile extends StatelessWidget {
  const DetailTile({
    super.key,
    required this.index,
    required this.ratingPercentage,
  });
  final int index;
  final double ratingPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Ratings(rating: index),
        6.toWidth(),
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 3,
              ),
              FractionallySizedBox(
                widthFactor: ratingPercentage / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 3,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

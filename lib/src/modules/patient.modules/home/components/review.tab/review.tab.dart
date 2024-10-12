import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/modules/patient.modules/home/providers/reviews.dart';
import 'package:flutter/material.dart';

import 'reveiw.tile.dart';
import 'review.summary.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          10.toHeight,
          const Expanded(child: ReviewSummary()),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => ReviewTile(reviews[index]),
              separatorBuilder: (_, index) => 10.toHeight,
              itemCount: reviews.length,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:com.codeconnect.driftekhar.patient/src/extensions/extensions.dart';
import 'package:com.codeconnect.driftekhar.patient/src/modules/home/providers/reviews.dart';
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
        mainAxisSize: MainAxisSize.min,
        children: [
          10.toHeight,
          const ReviewSummary(),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: reviews
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ReviewTile(e),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

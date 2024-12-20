import 'package:cached_network_image/cached_network_image.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../models/review.dart';
import 'ratings.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile(this.review, {super.key});
  final PatientReview review;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: review.imageUrl ?? '',
            imageBuilder: (context, imageProvider) => Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Expanded(
            flex: 3,
            child: Text(
              review.name ?? '',
              style: context.text.titleMedium,
            )),
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  review.rating.toString(),
                  style: context.text.titleMedium,
                ),
                Ratings(rating: review.rating!)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

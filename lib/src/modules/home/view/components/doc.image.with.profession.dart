import 'package:com.codeconnect.driftekhar.patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

final List<String> icons = 'youtube,insta,snap,tiktok,whatsapp'.split(',');

class CoverWithProfilePicture extends StatelessWidget {
  const CoverWithProfilePicture({super.key});
  final _height = 160.0;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: _height,
      flexibleSpace: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomStart,
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/jpg/doc.jpg'),
              fit: BoxFit.cover,
              // image: NetworkImage(imageLInk),
            ),
          ),
          Positioned(
            bottom: -_height / 3,
            child: SizedBox(
              width: context.width,
              child: const CircleAvatar(radius: 60),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({super.key, this.title, this.icon, this.followers, this.iconPath, this.onTap});
  final String? title, iconPath;
  final IconData? icon;
  final String? followers;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 30, right: 10, left: 0),
      constraints: BoxConstraints(maxWidth: context.width * 0.45),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          const SizedBox.expand(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title ?? '', style: context.text.titleMedium),
                  Text('$followers', style: context.text.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
                  const Text('Followers')
                ],
              ),
              SvgPicture.asset(iconPath!, height: 40, width: 40)
              // Icon(icon, size: 33),
            ],
          ),
          Positioned(
            // bottom: -22,
            bottom: 0,
            child: Material(
              child: SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton.icon(
                  onPressed: onTap,
                  label: Text(
                    'Follow',
                    style: context.text.bodySmall,
                  ),
                  icon: const Center(child: Icon(FontAwesomeIcons.plus, size: 12)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({super.key, required this.gridItem, this.onTap});
  final GridItem gridItem;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: context.width * 0.4, maxWidth: context.width * 0.5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          border: Border.all(color: context.theme.primaryColor.withAlpha(150)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(gridItem.imagePath),
            ),
            5.toHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  gridItem.title,
                  textAlign: TextAlign.start,
                  style: context.text.titleMedium!.copyWith(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text('helo'),
                SvgPicture.asset(
                  'assets/icons/arrow.double.svg',
                  colorFilter: ColorFilter.mode(context.theme.primaryColor, BlendMode.srcIn),
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return InkWell(
    //   onTap: onTap,
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Image.asset(
    //         gridItem.imagePath,
    //         height: 50,
    //         width: 50,
    //       ),
    //       5.toHeight,
    //       Text(
    //         gridItem.title,
    //         textAlign: TextAlign.center,
    //         style: context.text.titleMedium!.copyWith(
    //           color: context.theme.primaryColor,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

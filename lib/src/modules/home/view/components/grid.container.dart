import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/home/models/grid.model.dart';
import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({super.key, required this.gridItem, this.onTap});
  final GridItem gridItem;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    // print('grid cont ${gridItem.title}');
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(gridItem.imagePath, height: 50, width: 50),
          5.toHeight,
          Flexible(
            child: Text(
              gridItem.title,
              textAlign: TextAlign.center,
              style: context.text.titleMedium!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
  //   return InkWell(
  //     onTap: onTap,
  //     child: Container(
  //       height: 140,
  //       width: 140,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.indigoAccent),
  //         borderRadius: BorderRadius.circular(6),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Expanded(
  //             child: Image.asset(gridItem.imagePath, height: 50, width: 50),
  //           ),
  //           5.toHeight,
  //           Flexible(
  //             child: Text(
  //               gridItem.title,
  //               textAlign: TextAlign.center,
  //               style: context.text.bodySmall!.copyWith(
  //                 color: context.theme.primaryColor,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

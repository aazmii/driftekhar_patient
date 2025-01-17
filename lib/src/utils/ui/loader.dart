import 'package:driftekhar_patient/src/app.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future showLoader({String? msg}) async {
  if (navigatorKey.currentContext == null) return;
  showDialog(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    builder: (context) => LoadingWidget(msg: msg),
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.msg});
  // final _defaultMsg = 'Loading, please wait...';
  final String? msg;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // const CircularProgressIndicator(),
          Lottie.asset(
            'assets/lotties/loader.json',
            height: 100,
            width: 100,
          ),
          if (msg != null) ...[
            const SizedBox(height: 15),
            Text(
              msg!,
              style: context.text.titleMedium,
            ),
          ],
        ]),
      ),
    );
  }
}

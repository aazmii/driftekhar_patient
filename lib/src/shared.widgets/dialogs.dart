import 'package:driftekhar_patient/src/app.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
 

Future showErrorDialog(String msg, {String? subtitle}) {
  return showDialog<void>(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(msg),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                subtitle ?? '',
                style: context.text.titleMedium,
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future showWarning({required String msg}) {
  return showDialog<void>(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                msg,
                style: context.text.titleMedium,
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';

class NotifyMethodContainer extends StatelessWidget {
  const NotifyMethodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: (1),
            groupValue: 1,
            onChanged: (v) {},
            title: const Text('SMS'),
          ),
        ),
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: (1),
            groupValue: 2,
            onChanged: (v) {},
            title: const Text('Email'),
          ),
        ),
      ],
    );
  }
}

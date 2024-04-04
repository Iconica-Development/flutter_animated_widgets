// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause
import 'package:flutter/material.dart';
import 'package:flutter_animated_widgets/flutter_animated_widgets.dart';

class AnimatedNoticationBellExample extends StatefulWidget {
  const AnimatedNoticationBellExample({super.key});

  @override
  State<AnimatedNoticationBellExample> createState() =>
      _AnimatedNoticationBellExampleState();
}

class _AnimatedNoticationBellExampleState
    extends State<AnimatedNoticationBellExample> {
  int notificationCount = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                notificationCount++;
              });
            },
            icon: const Icon(Icons.add),
          ),
          AnimatedNotificationBell(
            notificationCount: notificationCount,
            style: const AnimatedNotificationBellStyle(),
            iterations: notificationCount,
            duration: const Duration(
              milliseconds: 1000,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                notificationCount--;
              });
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

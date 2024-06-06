import "package:flutter/material.dart";

/// A class that defines the style for the animated notification bell.
class AnimatedNotificationBellStyle {
  const AnimatedNotificationBellStyle({
    this.notificationIconSize = 50,
    this.bellColor = Colors.black,
    this.amountCircleColor = Colors.red,
    this.amountCircleSize = 25,
    this.amountCircleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    this.maxNotificationNumber = 99,
    this.notificationIcon = Icons.notifications,
    this.showNotificationCount = true,
  });

  /// The size of the icon.
  ///
  /// Making it small will cause the UI to glitch,
  /// A minimal size of 50 is recommended
  final double notificationIconSize;

  /// The color of the notification bell icon.
  final Color bellColor;

  /// The color of the notification amount circle.
  final Color amountCircleColor;

  /// The size of the notification amount circle.
  final double amountCircleSize;

  /// The text style of the notification amount.
  final TextStyle amountCircleTextStyle;

  /// The max number of notifications that will be shown. When the amount
  /// exceeds this value, this value is shown with a plus behind it.
  final int maxNotificationNumber;

  /// The icon that will be shown in the notification bell.
  final IconData notificationIcon;

  /// Whether the notification count should be shown.
  final bool showNotificationCount;
}

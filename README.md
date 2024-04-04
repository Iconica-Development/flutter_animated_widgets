[![pub package](https://img.shields.io/pub/v/[PACKAGE NAME ON PUB].svg)](https://github.com/Iconica-Development) [![Build status](URL TO REPO)](URL TO GITHUB ACTIONS) [![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart) 
# flutter_animated_widgets


A set of common implicit animation widgets to expand upon the default flutter animation widgets

Figma Design that defines this component (only accessible for Iconica developers): https://www.figma.com/file/4WkjwynOz5wFeFBRqTHPeP/Iconica-Design-System?type=design&node-id=356%3A3329&mode=design&t=XulkAJNPQ32ARxWh-1

## Setup

<details>
<summary>PLATFORM</summary>
    
This package works on all platforms that are supported by Flutter.

</details>

## How to use

## Features

Here is a list of available widgets.

### 1. AnimatedNotificationBell
A widget that creates a swing animation whenever the amount of notifications goes up.

example:
```
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
```

## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/Iconica-Development/flutter_animated_widgets) page. Commercial support is available if you need help with integration with your app or services. You can contact us at [support@iconica.nl](mailto:support@iconica.nl).

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](../CONTRIBUTING.md) and send us your [pull request](https://github.com/Iconica-Development/flutter_animated_widgets/pulls).

## Author

This flutter_animated_widgets for Flutter is developed by [Iconica](https://iconica.nl). You can contact us at <support@iconica.nl>
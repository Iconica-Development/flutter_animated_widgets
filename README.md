# flutter_animated_widgets
A set of common implicit animation widgets to expand upon the default flutter animation widgets

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
    notificationIconSize: 50,
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
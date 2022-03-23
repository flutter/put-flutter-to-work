Platform specific package for closing app programmatically

## Features

Supports programmatically closing iOS, Android and Web app

## Usage

```dart
IconButton(
    onPressed: PlatformClose.instance.close,
    icon: const Icon(Icons.close),
),
```

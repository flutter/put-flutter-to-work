import 'package:flutter/services.dart';
import 'package:platform_close/platform_close.dart';

class MobileClose implements PlatformClose {
  const MobileClose({required this.closeCallback});

  final VoidCallback closeCallback;

  @override
  void close() {
    closeCallback();
  }
}

PlatformClose getPlatformClose() =>
    const MobileClose(closeCallback: SystemNavigator.pop);

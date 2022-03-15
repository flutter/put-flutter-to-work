import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nps/helpers/helpers.dart';

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

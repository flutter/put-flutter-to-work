import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nps/helpers/helpers.dart';

class MobileClose implements PlatformClose {
  MobileClose({required this.closeCallback});

  VoidCallback closeCallback;

  @override
  void close() {
    closeCallback();
  }
}

PlatformClose getPlatformClose() =>
    MobileClose(closeCallback: SystemNavigator.pop);

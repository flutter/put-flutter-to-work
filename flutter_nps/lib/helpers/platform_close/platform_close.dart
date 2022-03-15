// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_nps/helpers/platform_close/platform_close_stub.dart'
    if (dart.library.io) 'package:flutter_nps/helpers/platform_close/mobile_close.dart'
    if (dart.library.html) 'package:flutter_nps/helpers/platform_close/web_close.dart';

abstract class PlatformClose {
  static PlatformClose get instance => platform ?? getPlatformClose();

  @visibleForTesting
  static PlatformClose? platform;

  void close();
}

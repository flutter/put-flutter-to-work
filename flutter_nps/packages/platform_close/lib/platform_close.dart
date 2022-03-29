library platform_close;

import 'package:flutter/material.dart';
import 'package:platform_close/platform_close_stub.dart'
    if (dart.library.io) 'package:platform_close/mobile_close.dart'
    if (dart.library.html) 'package:platform_close/web_close.dart';

abstract class PlatformClose {
  static PlatformClose get instance => platform ?? getPlatformClose();

  @visibleForTesting
  static PlatformClose? platform;

  void close();
}

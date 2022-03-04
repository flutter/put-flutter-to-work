// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_nps/helper/platform_close/platform_close_stub.dart'
    if (dart.library.io) 'package:flutter_nps/helper/platform_close/mobile_close.dart'
    if (dart.library.html) 'package:flutter_nps/helper/platform_close/web_close.dart';

abstract class PlatformClose {
  factory PlatformClose() => getPlatformClose();

  void close() {}
}

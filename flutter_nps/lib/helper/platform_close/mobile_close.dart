import 'package:flutter/services.dart';
import 'package:flutter_nps/helper/helpers.dart';

class WebClose implements PlatformClose {
  @override
  void close() {
    SystemNavigator.pop();
  }
}

PlatformClose getPlatformClose() => WebClose();

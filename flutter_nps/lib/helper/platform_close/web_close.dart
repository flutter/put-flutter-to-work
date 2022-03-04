// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter_nps/helper/helpers.dart';

class WebClose implements PlatformClose {
  @override
  void close() {
    html.window.close();
    html.window.parent?.postMessage('close', '*');
  }
}

PlatformClose getPlatformClose() => WebClose();

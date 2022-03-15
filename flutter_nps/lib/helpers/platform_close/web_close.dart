// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter_nps/helpers/helpers.dart';

class WebClose implements PlatformClose {
  const WebClose({required this.window});

  final Window window;

  @override
  void close() {
    window.close();
    window.parent?.postMessage('close', '*');
  }
}

PlatformClose getPlatformClose() => WebClose(window: window);

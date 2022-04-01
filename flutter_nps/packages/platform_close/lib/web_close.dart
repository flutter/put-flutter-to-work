// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:platform_close/platform_close.dart';

class WebClose implements PlatformClose {
  const WebClose({required this.window});

  final Window window;

  @override
  void close() {
    window.parent?.postMessage('close', '*');
    document.getElementById('iframe')?.remove();
  }
}

PlatformClose getPlatformClose() => WebClose(window: window);

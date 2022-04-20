import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {List<NavigatorObserver>? observers}) {
    return pumpWidget(
      MaterialApp(
        theme: AppTheme().theme,
        home: Scaffold(
          body: widget,
        ),
      ),
    );
  }
}

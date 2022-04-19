import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CrossCloseButton', () {
    testWidgets('renders IconButton', (tester) async {
      final completer = Completer<void>();
      await tester.pumpApp(CrossCloseButton(onPressed: completer.complete));

      await tester.tap(find.byType(IconButton));

      expect(completer.isCompleted, isTrue);
    });
  });
}

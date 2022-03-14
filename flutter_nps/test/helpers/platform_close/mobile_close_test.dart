import 'package:flutter/material.dart';
import 'package:flutter_nps/helpers/platform_close/mobile_close.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers.dart';

class MockFunction extends Mock {
  void call();
}

void main() {
  group('MobileClose', () {
    testWidgets('close calls closeCallback', (tester) async {
      const testText = 'test';
      final myFn = MockFunction();
      final mobileClose = MobileClose(closeCallback: myFn);

      await tester.pumpApp(
        ElevatedButton(
          onPressed: mobileClose.close,
          child: const Text(testText),
        ),
      );

      await tester.tap(find.widgetWithText(ElevatedButton, testText).first);

      await tester.pumpAndSettle();

      verify(myFn.call).called(1);
    });
  });
}

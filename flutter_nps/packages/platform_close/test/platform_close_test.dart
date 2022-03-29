import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:platform_close/mobile_close.dart' as mobile;
import 'package:platform_close/platform_close.dart';

class MockMobileClose extends Mock implements mobile.MobileClose {}

void main() {
  group('PlatformClose', () {
    testWidgets('instance() calls close()', (tester) async {
      const testText = 'test';
      final mobileMock = MockMobileClose();
      PlatformClose.platform = mobileMock;

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: ElevatedButton(
            onPressed: PlatformClose.instance.close,
            child: const Text(testText),
          ),
        ),
      );

      await tester.tap(find.widgetWithText(ElevatedButton, testText).first);

      await tester.pumpAndSettle();

      verify(mobileMock.close).called(1);
    });
  });
}

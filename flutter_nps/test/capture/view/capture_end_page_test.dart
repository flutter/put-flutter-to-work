import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CaptureEndPage', () {
    testWidgets('renders CaptureView fullscreen on width <= 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(Breakpoints.small, 600));
      await tester.pumpApp(const CaptureEndPage());
      expect(
        find.ancestor(
          of: find.byType(CaptureEndView),
          matching: find.byType(Scaffold).first,
        ),
        findsOneWidget,
      );
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('renders CaptureView in card on width > 511 screen size',
        (tester) async {
      await tester.binding
          .setSurfaceSize(const Size(Breakpoints.small + 1, 600));

      await tester.pumpApp(const CaptureEndPage());

      expect(
        find.ancestor(
          of: find.byType(CaptureEndView),
          matching: find.byType(Card).first,
        ),
        findsOneWidget,
      );
      await tester.binding.setSurfaceSize(null);
    });
  });
}

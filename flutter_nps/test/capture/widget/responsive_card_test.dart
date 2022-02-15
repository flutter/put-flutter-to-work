import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/widget/responsive_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ResponsiveCard', () {
    testWidgets('renders CaptureView fullscreen on width <= 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(511, 600));
      await tester.pumpApp(
        const ResponsiveCard(
          child: Text('test'),
        ),
      );
      expect(
        find.ancestor(
          of: find.text('test'),
          matching: find.byType(Scaffold).first,
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders CaptureView in card on width > 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(512, 600));
      await tester.pumpApp(
        const ResponsiveCard(
          child: Text('test'),
        ),
      );

      expect(
        find.ancestor(
          of: find.text('test'),
          matching: find.byType(Card).first,
        ),
        findsOneWidget,
      );
    });
  });
}

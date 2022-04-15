import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ResponsiveCard', () {
    testWidgets('renders Text fullscreen on width <= 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(Breakpoints.small, 600));
      await tester.pumpApp(const ResponsiveCard(child: Text('text')));
      expect(
        find.ancestor(
          of: find.byType(Text),
          matching: find.byType(Scaffold).first,
        ),
        findsOneWidget,
      );
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('renders Text in card on width > 511 screen size',
        (tester) async {
      await tester.binding
          .setSurfaceSize(const Size(Breakpoints.small + 1, 600));

      await tester.pumpApp(const ResponsiveCard(child: Text('text')));

      expect(
        find.ancestor(
          of: find.byType(Text),
          matching: find.byType(Card).first,
        ),
        findsOneWidget,
      );
      await tester.binding.setSurfaceSize(null);
    });
  });
}

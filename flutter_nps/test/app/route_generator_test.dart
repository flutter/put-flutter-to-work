// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/view/capture_end_page.dart';
import 'package:flutter_nps/capture/view/capture_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/helpers.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });
  group('RouteGenerator', () {
    final navigatorObserver = MockNavigatorObserver();

    testWidgets('notified user on wrong route', (tester) async {
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            child: const Text('testButton'),
            onPressed: () => Navigator.of(context).pushNamed('unknownRoute'),
          ),
        ),
        observers: [navigatorObserver],
      );

      await tester.tap(find.widgetWithText(TextButton, 'testButton'));
      await tester.pumpAndSettle();

      expect(
        find.widgetWithText(Center, 'No route defined for unknownRoute'),
        findsOneWidget,
      );

      verify(
        () => navigatorObserver.didPush(
          any(that: isA<Route>()),
          any(that: isA<Route>()),
        ),
      );
    });

    testWidgets(
        'navigator.pushNamed ${CapturePage.routeName} builds CaptureView',
        (tester) async {
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            child: const Text('testButton'),
            onPressed: () =>
                Navigator.of(context).pushNamed(CapturePage.routeName),
          ),
        ),
        observers: [navigatorObserver],
      );

      await tester.tap(find.widgetWithText(TextButton, 'testButton'));
      await tester.pumpAndSettle();

      expect(
        find.byType(CaptureView),
        findsOneWidget,
      );

      verify(
        () => navigatorObserver.didPush(
          any(that: isA<Route>()),
          any(that: isA<Route>()),
        ),
      );
    });

    testWidgets(
        'navigator.pushNamed ${CaptureEndPage.routeName} builds CaptureEndView',
        (tester) async {
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            child: const Text('testButton'),
            onPressed: () =>
                Navigator.of(context).pushNamed(CaptureEndPage.routeName),
          ),
        ),
        observers: [navigatorObserver],
      );

      await tester.tap(find.widgetWithText(TextButton, 'testButton'));
      await tester.pumpAndSettle();

      expect(
        find.byType(CaptureEndView),
        findsOneWidget,
      );

      verify(
        () => navigatorObserver.didPush(
          any(that: isA<Route>()),
          any(that: isA<Route>()),
        ),
      );
    });
  });
}

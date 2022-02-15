// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nps/flutter_nps.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCaptureCubit extends MockCubit<CaptureCubitState>
    implements CaptureCubit {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  group('CapturePage', () {
    testWidgets('renders CaptureView', (tester) async {
      await tester.pumpApp(const CapturePage());
      expect(find.byType(CaptureView), findsOneWidget);
    });
  });

  group('CaptureView', () {
    late CaptureCubit captureCubit;
    late NavigatorObserver navigatorObserver;

    setUp(() {
      captureCubit = MockCaptureCubit();
      navigatorObserver = MockNavigatorObserver();
    });

    testWidgets('renders 5 unselected widget', (tester) async {
      when(() => captureCubit.state).thenReturn(CaptureCubitState.initial());
      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
      );

      for (var i = 1; i <= 5; i++) {
        expect(
          find.widgetWithText(TextButton, i.toString()),
          findsOneWidget,
        );
      }
    });

    testWidgets('calls selectScore when score is tapped', (tester) async {
      when(() => captureCubit.state).thenReturn(CaptureCubitState.initial());

      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
      );

      await tester.tap(find.widgetWithText(TextButton, '1'));

      verify(() => captureCubit.selectScore(score: 1)).called(1);
    });

    testWidgets('selectedScore has changed background', (tester) async {
      when(() => captureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: []));

      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
      );

      final decoration = tester
          .widget<AnimatedContainer>(
            find.ancestor(
              of: find.widgetWithText(TextButton, '1'),
              matching: find.byType(AnimatedContainer),
            ),
          )
          .decoration as BoxDecoration?;
      expect(decoration, isNotNull);
      expect(decoration?.color, NpsColors.colorSecondary);
    });

    testWidgets('unselected Chip calls addChip when tapped', (tester) async {
      when(() => captureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: []));

      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
      );

      await tester.tap(find.byType(ActionChip).first);

      verify(() => captureCubit.addChipIndex(index: any(named: 'index')))
          .called(1);
    });

    testWidgets('selected Chip calls removeChip when tapped', (tester) async {
      when(() => captureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: [0]));

      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
      );

      await tester.tap(find.byType(ActionChip).first);

      verify(() => captureCubit.removeChipIndex(index: any(named: 'index')))
          .called(1);
    });

    testWidgets('submits on Submit button tap', (tester) async {
      when(() => captureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: [0]));
      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
        observers: [navigatorObserver],
      );

      await tester.tap(find.widgetWithText(ElevatedButton, 'Submit').first);

      await tester.pumpAndSettle();
      verify(() => captureCubit.submitResult()).called(1);
      verify(
        () => navigatorObserver.didPush(
          any(that: isA<Route>()),
          any(that: isA<Route>()),
        ),
      );
    });

    // TODO(Jan-Stepien): Implement Need Help button test
    testWidgets('resolve need help funciton when tapped need help button',
        (tester) async {
      when(() => captureCubit.state)
          .thenReturn(const CaptureCubitState(score: -1, chipIndexes: [0]));

      await tester.pumpApp(
        BlocProvider.value(
          value: captureCubit,
          child: const CaptureView(),
        ),
      );

      final button = find.widgetWithText(TextButton, Texts.needHelp);

      await tester.dragUntilVisible(
        button,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );

      await tester.tap(button);

      verify(() => captureCubit.callNeedHelp()).called(1);
    });
  });
}

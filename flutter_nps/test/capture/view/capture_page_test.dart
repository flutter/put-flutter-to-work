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

void main() {
  group('CapturePage', () {
    testWidgets('renders CaptureView fullscreen on width <= 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(511, 600));
      await tester.pumpApp(const CapturePage());
      expect(
        find.ancestor(
          of: find.byType(CaptureView),
          matching: find.byType(Scaffold).first,
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders CaptureView in card on width > 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(512, 600));

      await tester.pumpApp(const CapturePage());

      expect(
        find.ancestor(
          of: find.byType(CaptureView),
          matching: find.byType(Card).first,
        ),
        findsOneWidget,
      );
    });
  });

  group('CaptureView', () {
    late CaptureCubit captureCubit;

    setUp(() {
      captureCubit = MockCaptureCubit();
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

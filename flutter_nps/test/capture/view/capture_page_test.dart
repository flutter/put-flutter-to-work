// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_nps/colors.dart';
import 'package:flutter_nps/texts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockCaptureCubit extends MockCubit<CaptureCubitState>
    implements CaptureCubit {}

void main() {
  group('CapturePage', () {
    testWidgets('renders CaptureView', (tester) async {
      await tester.pumpApp(const CapturePage());
      expect(find.byType(CaptureView), findsOneWidget);
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
          tester
              .widget<CircleAvatar>(
                find.widgetWithText(CircleAvatar, i.toString()),
              )
              .backgroundColor,
          NpsColors.colorGrey5,
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

      await tester.tap(find.widgetWithText(CircleAvatar, '1'));

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

      expect(
        tester
            .widget<CircleAvatar>(find.widgetWithText(CircleAvatar, '1'))
            .backgroundColor,
        NpsColors.colorSecondary,
      );
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

      await tester.tap(find.widgetWithText(Chip, 'Short').first);

      verify(() => captureCubit.addChipIndex(index: 0)).called(1);
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

      await tester.tap(find.widgetWithText(Chip, 'Short').first);

      verify(() => captureCubit.removeChipIndex(index: 0)).called(1);
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

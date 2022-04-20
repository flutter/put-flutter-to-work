import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockNoSubmitCaptureCubit extends MockCubit<CaptureCubitState>
    implements CaptureCubit {}

class MockSubmitCaptureCubit extends MockCubit<CaptureCubitState>
    implements CaptureCubit {}

void main() {
  group('CapturePage', () {
    testWidgets('renders CaptureView fullscreen on width <= 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(Breakpoints.small, 600));
      await tester.pumpApp(const CapturePage());
      expect(
        find.ancestor(
          of: find.byType(CaptureView),
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

      await tester.pumpApp(const CapturePage());

      expect(
        find.ancestor(
          of: find.byType(CaptureView),
          matching: find.byType(Card).first,
        ),
        findsOneWidget,
      );
      await tester.binding.setSurfaceSize(null);
    });
  });

  group('CaptureView', () {
    late CaptureCubit noSubmitCaptureCubit;
    late CaptureCubit submitCaptureCubit;

    setUp(() {
      noSubmitCaptureCubit = MockNoSubmitCaptureCubit();
      submitCaptureCubit = MockSubmitCaptureCubit();
    });

    testWidgets('renders 5 unselected widget', (tester) async {
      when(() => noSubmitCaptureCubit.state)
          .thenReturn(CaptureCubitState.initial());
      await tester.pumpApp(
        BlocProvider(
          create: (_) => noSubmitCaptureCubit,
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
      when(() => noSubmitCaptureCubit.state)
          .thenReturn(CaptureCubitState.initial());

      await tester.pumpApp(
        BlocProvider.value(
          value: noSubmitCaptureCubit,
          child: const CaptureView(),
        ),
      );

      await tester.tap(find.widgetWithText(TextButton, '1'));

      verify(() => noSubmitCaptureCubit.selectScore(score: 1)).called(1);
    });

    testWidgets('selectedScore has changed background', (tester) async {
      when(() => noSubmitCaptureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: []));

      await tester.pumpApp(
        BlocProvider.value(
          value: noSubmitCaptureCubit,
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
      when(() => noSubmitCaptureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: []));

      await tester.pumpApp(
        BlocProvider.value(
          value: noSubmitCaptureCubit,
          child: const CaptureView(),
        ),
      );

      await tester.tap(find.byType(ActionChip).first);

      verify(
        () => noSubmitCaptureCubit.chipToggled(index: any(named: 'index')),
      ).called(1);
    });

    testWidgets('selected Chip calls removeChip when tapped', (tester) async {
      when(() => noSubmitCaptureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: [0]));

      await tester.pumpApp(
        BlocProvider.value(
          value: noSubmitCaptureCubit,
          child: const CaptureView(),
        ),
      );

      await tester.tap(find.byType(ActionChip).first);

      verify(
        () => noSubmitCaptureCubit.chipToggled(index: any(named: 'index')),
      ).called(1);
    });

    testWidgets('submit button calls cubit submitResult on tap',
        (tester) async {
      when(() => submitCaptureCubit.state)
          .thenReturn(const CaptureCubitState(score: 1, chipIndexes: [1]));
      when(() => submitCaptureCubit.submitResult())
          .thenAnswer((invocation) => Future.value());

      await tester.pumpApp(
        BlocProvider.value(
          value: submitCaptureCubit,
          child: const CaptureView(),
        ),
      );

      final button = find.byKey(const Key('capturePage_submit_elevatedButton'));

      await tester.dragUntilVisible(
        button,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );

      await tester.tap(button);

      verify(() => submitCaptureCubit.submitResult()).called(1);
    });
  });
}

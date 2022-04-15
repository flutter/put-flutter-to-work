import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AnswerChips', () {
    final chips = ['a', 'b', 'c'];
    final selectedChipsIndexes = [0, 1];
    testWidgets(
      'renders 3 chips',
      (WidgetTester tester) async {
        await tester.pumpApp(
          AnswerChips(
            chips: chips,
            selectedChipsIndexes: selectedChipsIndexes,
            chipToogleCallback: (_) {},
          ),
        );

        expect(find.byType(ActionChip), findsNWidgets(3));
      },
    );

    testWidgets(
      'tap callback with first',
      (WidgetTester tester) async {
        final completer = Completer<int>();
        await tester.pumpApp(
          AnswerChips(
            chips: chips,
            selectedChipsIndexes: selectedChipsIndexes,
            chipToogleCallback: completer.complete,
          ),
        );

        await tester.tap(find.byType(ActionChip).first);

        expect(completer.isCompleted, isTrue);
        expect(await completer.future, equals(0));
      },
    );

    testWidgets(
      'tap callback with last index',
      (WidgetTester tester) async {
        final completer = Completer<int>();
        await tester.pumpApp(
          AnswerChips(
            chips: chips,
            selectedChipsIndexes: selectedChipsIndexes,
            chipToogleCallback: completer.complete,
          ),
        );

        await tester.tap(find.byType(ActionChip).last);

        expect(completer.isCompleted, isTrue);
        expect(await completer.future, equals(2));
      },
    );
  });
}

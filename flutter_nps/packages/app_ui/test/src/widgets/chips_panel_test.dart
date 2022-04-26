import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ChipsPanel', () {
    const chips = ['a', 'b', 'c', 'd'];

    testWidgets(
      'renders chips with disabled button',
      (tester) async {
        await tester.pumpApp(
          ChipsPanel(
            chips: chips,
            canSubmit: false,
            selectedChipIndexes: const [],
            chipToggleCallback: (number) {},
            onSubmit: () {},
          ),
        );

        expect(find.byType(ActionChip), findsNWidgets(chips.length));

        final submitButton = find.byType(ElevatedButton);
        expect(submitButton, findsNWidgets(1));
        expect(tester.widget<ElevatedButton>(submitButton).enabled, isFalse);
      },
    );

    testWidgets(
      'executes onSubmit when button pressed',
      (tester) async {
        final completer = Completer<void>();
        await tester.pumpApp(
          ChipsPanel(
            chips: chips,
            canSubmit: true,
            selectedChipIndexes: const [0],
            chipToggleCallback: (number) {},
            onSubmit: completer.complete,
          ),
        );

        final submitButton = find.byType(ElevatedButton);
        expect(submitButton, findsNWidgets(1));
        expect(tester.widget<ElevatedButton>(submitButton).enabled, isTrue);

        await tester.tap(submitButton);

        expect(completer.isCompleted, isTrue);
      },
    );
  });
}

import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('SubmitButton', () {
    const buttonText = 'test';
    testWidgets(
      'submits on click',
      (tester) async {
        final completer = Completer<void>();
        await tester.pumpApp(
          SubmitButton(
            onPressed: completer.complete,
            buttonText: buttonText,
          ),
        );
        await tester.tap(find.byType(ElevatedButton).first);

        await tester.pumpAndSettle();

        expect(completer.isCompleted, isTrue);
      },
    );
  });
}

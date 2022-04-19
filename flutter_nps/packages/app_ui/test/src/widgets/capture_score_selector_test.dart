import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CaptureScoreSelector', () {
    const maxScore = 3;
    const selectedIndex = -1;

    testWidgets(
      'renders 3 chips',
      (tester) async {
        await tester.pumpApp(
          CaptureScoreSelector(
            maxScore: maxScore,
            selectedIndex: selectedIndex,
            selectedCallback: (_) {},
          ),
        );

        expect(find.byType(ScoreButton), findsNWidgets(3));
      },
    );

    testWidgets(
      'tap callback with index 0',
      (tester) async {
        final completer = Completer<int>();
        await tester.pumpApp(
          CaptureScoreSelector(
            maxScore: maxScore,
            selectedIndex: selectedIndex,
            selectedCallback: completer.complete,
          ),
        );

        await tester.tap(find.byType(ScoreButton).first);

        expect(completer.isCompleted, isTrue);
        expect(await completer.future, equals(0));
      },
    );
  });
}

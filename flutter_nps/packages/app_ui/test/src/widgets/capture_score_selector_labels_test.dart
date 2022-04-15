import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CaptureScoreSelectorLabels', () {
    const maxLabel = 'max';
    const minLabel = 'min';
    final uniqueKey = UniqueKey();
    testWidgets(
      'renders assets and texts',
      (WidgetTester tester) async {
        await tester.pumpApp(
          CaptureScoreSelectorLabels(
            key: uniqueKey,
            maxLabel: maxLabel,
            minLabel: minLabel,
          ),
        );

        expect(find.text(minLabel), findsOneWidget);
        expect(find.text(maxLabel), findsOneWidget);
        expect(find.image(Assets.icons.lovingEmoji), findsOneWidget);
        expect(find.image(Assets.icons.thumbDownEmoji), findsOneWidget);
      },
    );
  });
}

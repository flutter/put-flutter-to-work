// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CaptureScoreSelectorLabels', () {
    const maxLabel = 'max';
    const minLabel = 'min';
    testWidgets(
      'renders assets and texts',
      (tester) async {
        await tester.pumpApp(
          CaptureScoreSelectorLabels(
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

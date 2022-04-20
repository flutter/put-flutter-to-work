import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('AppTheme', () {
    const textWidget = Text('test');
    const disabledButton = ElevatedButton(onPressed: null, child: textWidget);
    final enabledButton = ElevatedButton(onPressed: () {}, child: textWidget);
    testWidgets('renders enabled and disabled style', (tester) async {
      await tester.pumpApp(
        ListView(
          children: [disabledButton, enabledButton],
        ),
      );

      expect(
        tester.widget<ElevatedButton>(find.byWidget(disabledButton)).enabled,
        isFalse,
      );
      expect(
        tester.widget<ElevatedButton>(find.byWidget(enabledButton)).enabled,
        isTrue,
      );
    });
  });
}

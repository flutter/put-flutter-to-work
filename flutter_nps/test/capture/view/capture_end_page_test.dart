// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CaptureEndPage', () {
    testWidgets('renders CaptureView fullscreen on width <= 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(511, 600));
      await tester.pumpApp(const CaptureEndPage());
      expect(
        find.ancestor(
          of: find.byType(CaptureEndView),
          matching: find.byType(Scaffold).first,
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders CaptureView in card on width > 511 screen size',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(512, 600));

      await tester.pumpApp(const CaptureEndPage());

      expect(
        find.ancestor(
          of: find.byType(CaptureEndView),
          matching: find.byType(Card).first,
        ),
        findsOneWidget,
      );
    });
  });
}

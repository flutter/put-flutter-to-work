// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CrossCloseButton', () {
    testWidgets('renders IconButton', (tester) async {
      final completer = Completer<void>();
      await tester.pumpApp(CrossCloseButton(onPressed: completer.complete));

      await tester.tap(find.byType(IconButton));

      expect(completer.isCompleted, isTrue);
    });
  });
}

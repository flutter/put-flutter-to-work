// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {List<NavigatorObserver>? observers}) {
    return pumpWidget(
      MaterialApp(
        theme: AppTheme().theme,
        home: Scaffold(
          body: widget,
        ),
      ),
    );
  }
}

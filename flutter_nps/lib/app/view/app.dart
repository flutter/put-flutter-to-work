// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_nps/app_theme.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_nps/colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: const Scaffold(
        backgroundColor: NpsColors.colorWhite,
        body: CapturePage(),
      ),
    );
  }
}

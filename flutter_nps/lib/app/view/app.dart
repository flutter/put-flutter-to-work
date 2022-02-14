// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_nps/colors.dart';
import 'package:flutter_nps/styles.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            accentColor: NpsColors.colorSecondary,
            backgroundColor: NpsColors.colorWhite),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: NpsColors.colorSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (!states.contains(MaterialState.disabled)) {
                  return NpsColors.colorSecondary;
                } else if (states.contains(MaterialState.disabled)) {
                  return NpsColors.colorWhite;
                }
                return null;
              },
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline5: NpsStyles.headline5,
          subtitle1: NpsStyles.subtitle1,
          bodyText2: NpsStyles.link,
        ),
      ),
      home: const Scaffold(
        backgroundColor: NpsColors.colorWhite,
        body: CapturePage(),
      ),
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: NpsColors.colorSecondary,
          backgroundColor: NpsColors.colorWhite,
        ),
        scaffoldBackgroundColor: NpsColors.colorWhite,
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
      );
}

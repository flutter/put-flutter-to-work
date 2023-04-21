import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: NpsColors.colorSecondary,
          backgroundColor: NpsColors.colorWhite,
        ),
        scaffoldBackgroundColor: NpsColors.colorWhite,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: NpsColors.colorSecondary,
            foregroundColor: NpsColors.colorWhite,
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
          headlineSmall: NpsStyles.headline5,
          titleMedium: NpsStyles.subtitle1,
          bodyMedium: NpsStyles.link,
        ),
      );
}

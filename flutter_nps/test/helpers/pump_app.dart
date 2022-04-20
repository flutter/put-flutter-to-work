import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_nps/app/route_generator.dart';
import 'package:flutter_nps/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {List<NavigatorObserver>? observers}) {
    return pumpWidget(
      MaterialApp(
        navigatorObservers: observers ?? [],
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: widget,
        ),
      ),
    );
  }
}

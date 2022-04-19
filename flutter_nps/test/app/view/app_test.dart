import 'package:flutter_nps/app/app.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CapturePage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CapturePage), findsOneWidget);
    });
  });
}

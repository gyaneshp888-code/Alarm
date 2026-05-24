import 'package:flutter_test/flutter_test.dart';
import 'package:nova_alarm/app.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NovaAlarmApp());

    // Verify that the app title or a key widget exists
    expect(find.text('NOVA ALARM'), findsOneWidget);
  });
}

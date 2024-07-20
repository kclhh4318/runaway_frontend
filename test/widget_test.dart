import 'package:flutter_test/flutter_test.dart';
import 'package:runaway/app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RunawayApp());

    expect(find.text('Home Screen'), findsOneWidget);
  });
}
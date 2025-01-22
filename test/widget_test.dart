import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_manager_app/main.dart';
import 'package:project_manager_app/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen is displayed initially',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that the LoginScreen is displayed
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that the counter starts at 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter has incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

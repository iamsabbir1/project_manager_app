import 'package:flutter_test/flutter_test.dart';
import 'package:project_manager_app/main.dart';

void main() {
  testWidgets('MyApp has a title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that MyApp has the expected title
    expect(find.text('Flutter Demo'), findsOneWidget);
  });
}

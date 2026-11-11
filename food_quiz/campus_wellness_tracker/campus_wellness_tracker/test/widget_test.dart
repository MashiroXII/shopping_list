import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campus_wellness_tracker/main.dart';

void main() {
  testWidgets('Home Screen layout and assessment navigation smoke test', (WidgetTester tester) async {
    // 1. Build our app and trigger a frame.
    await tester.pumpWidget(const CampusWellnessTrackerApp());

    // 2. Verify that the welcome elements and layout exist on the screen.
    expect(find.text('Campus Wellness Tracker'), findsOneWidget);
    expect(find.text('Evaluate your current study-life balance.'), findsOneWidget);
    expect(find.text('Start Assessment'), findsOneWidget);

    // 3. Tap the 'Start Assessment' button and trigger a frame transition.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for navigation animation to finish

    // 4. (Optional) Add verification for elements inside AssessmentScreen here
  });
}

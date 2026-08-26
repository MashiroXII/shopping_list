import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/quiz_start_screen.dart';

void main() {
  testWidgets('Quiz app start screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizStartScreen(),
        ),
      ),
    );

    expect(find.text('Learn Flutter with fun!'), findsOneWidget);

    expect(find.text('Start Quiz'), findsOneWidget);
  });
}


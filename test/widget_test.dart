import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schach_app/features/home/screens/home_screen.dart';

void main() {
  testWidgets('home screen shows main entries', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('Schach Lernen'), findsOneWidget);
    expect(find.text('Lerne Lektionen'), findsOneWidget);
    expect(find.text('Puzzle spielen'), findsOneWidget);
    expect(find.text('Gegen KI spielen'), findsOneWidget);
  });
}

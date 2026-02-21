import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:schach_app/features/home/screens/home_screen.dart';

void main() {
  testGoldens('home screen golden smoke', (WidgetTester tester) async {
    final builder = DeviceBuilder()
      ..addScenario(widget: const MaterialApp(home: HomeScreen()));

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'home_screen_smoke');
  }, skip: true);
}

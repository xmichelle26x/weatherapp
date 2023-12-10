// main_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/main.dart';

void main() {
  testWidgets('Weather App UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify the initial UI state.
    expect(find.text('Weather App'), findsOneWidget);
    expect(find.text('Enter city name'), findsOneWidget);
    expect(find.text('Get Weather'), findsOneWidget);
    expect(find.text('City:'), findsNothing);
    expect(find.text('Temperature:'), findsNothing);
    expect(find.text('Weather Condition:'), findsNothing);

    // Simulate user input and tap the button.
    await tester.enterText(find.byType(TextField), 'London');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the updated UI state after fetching weather data.
    expect(find.text('City: London'), findsOneWidget);
    expect(find.text('Temperature:'), findsOneWidget);
    expect(find.text('Weather Condition:'), findsOneWidget);
  });
}

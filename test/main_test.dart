import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/main.dart';

void main() {
  testWidgets('Weather app UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify if the initial UI elements are present.
    expect(find.text('Weather App'), findsOneWidget);
    expect(find.text('Enter city name'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the "Get Weather" button and wait for the response.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify if the city error message is displayed.
    expect(find.text('City not found. Please enter a valid city name.'), findsOneWidget);
  });
}


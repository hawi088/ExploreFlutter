import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration_app/main.dart';
import 'package:registration_app/screens/registration_screen.dart';

void main() {
  group('Registration App Tests', () {
    testWidgets('Registration screen has all required fields', 
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const RegistrationApp());

      // Verify that all form fields exist
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
    });

    testWidgets('Validation works - empty fields show errors', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const RegistrationApp());

      // Find the register button and tap it
      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      await tester.tap(registerButton);
      await tester.pump();

      // Check for validation messages
      expect(find.text('Please enter your name'), findsOneWidget);
      expect(find.text('Please enter an email'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);
      expect(find.text('Please confirm your password'), findsOneWidget);
    });

    testWidgets('Validation works - invalid email shows error', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const RegistrationApp());

      // Enter valid data for other fields
      await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
      await tester.enterText(find.byType(TextFormField).at(1), 'invalid-email');
      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');

      // Tap register button
      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      await tester.tap(registerButton);
      await tester.pump();

      // Check for email validation error
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('Validation works - password mismatch shows error', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const RegistrationApp());

      // Enter valid data for all fields except password mismatch
      await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
      await tester.enterText(find.byType(TextFormField).at(1), 'john@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.enterText(find.byType(TextFormField).at(3), 'different123');

      // Tap register button
      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      await tester.tap(registerButton);
      await tester.pump();

      // Check for password mismatch error
      expect(find.text('Passwords do not match'), findsOneWidget);
    });

    testWidgets('Successful registration shows success dialog', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const RegistrationApp());

      // Enter valid data for all fields
      await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
      await tester.enterText(find.byType(TextFormField).at(1), 'john@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');

      // Tap register button
      final registerButton = find.widgetWithText(ElevatedButton, 'Register');
      await tester.tap(registerButton);
      await tester.pump();

      // Check for success dialog
      expect(find.text('Registration Successful'), findsOneWidget);
      expect(find.text('Welcome, John Doe!'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
    });
  });
}
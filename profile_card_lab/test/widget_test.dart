import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Profile card displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ProfileCardApp());

    // Verify that the profile name is displayed
    expect(find.text('Alex Johnson'), findsOneWidget);
    
    // Verify that the job title is displayed
    expect(find.text('Flutter Developer'), findsOneWidget);
    
    // Verify that the email and phone icons are present
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.phone), findsOneWidget);
    
    // Verify that the CircleAvatar is present
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
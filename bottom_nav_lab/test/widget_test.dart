// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botton_nav_lab/main.dart';

void main() {
  testWidgets('Bottom navigation bar test', (WidgetTester tester) async {
    await tester.pumpWidget(const BottomNavApp());

    // Verify that the home screen is shown
    expect(find.text('Bottom Navigation Demo'), findsOneWidget);
    expect(find.text('Go to Details'), findsOneWidget);

    // Tap on the favorites tab
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    // Verify that the favorites screen is shown
    expect(find.text('Your favorite items appear here.'), findsOneWidget);

    // Tap on the profile tab
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Verify that the profile screen is shown
    expect(find.text('User profile information.'), findsOneWidget);

    // Tap on the home tab
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    // Verify that the home screen is shown again
    expect(find.text('Go to Details'), findsOneWidget);
  });
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catalog_lab/main.dart';
import 'package:catalog_lab/screens/catalog_screen.dart';

void main() {
  group('Product Catalog Tests', () {
    testWidgets('Catalog screen has app bar and grid view', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const CatalogApp());

      // Check if app bar exists with correct title
      expect(find.text('Catalog'), findsOneWidget);
      
      // Check if GridView exists
      expect(find.byType(GridView), findsOneWidget);
      
      // Check if products are displayed (at least 6 products)
      expect(find.byType(Card), findsWidgets);
      expect(find.byType(InkWell), findsWidgets);
    });

    testWidgets('Catalog screen displays product names', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const CatalogApp());

      // Check if specific product names are displayed
      expect(find.text('Coffee Mug'), findsOneWidget);
      expect(find.text('Notebook'), findsOneWidget);
      expect(find.text('Pen Set'), findsOneWidget);
      expect(find.text('Backpack'), findsOneWidget);
    });

    testWidgets('Catalog screen displays product prices', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const CatalogApp());

      // Check if prices are displayed
      expect(find.text('\$12.99'), findsOneWidget);
      expect(find.text('\$5.99'), findsOneWidget);
      expect(find.text('\$8.49'), findsOneWidget);
      expect(find.text('\$49.99'), findsOneWidget);
    });

    testWidgets('Tapping a product shows snackbar', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const CatalogApp());

      // Find the first product card and tap it
      final firstCard = find.byType(Card).first;
      await tester.tap(firstCard);
      await tester.pump();

      // Check if snackbar appears
      expect(find.text('You selected Coffee Mug'), findsOneWidget);
    });

    testWidgets('Catalog grid layout is correct', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const CatalogApp());

      // Find GridView and verify its properties
      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);

      // Check number of products
      final productCards = find.byType(Card);
      expect(productCards, findsNWidgets(12));
    });

    testWidgets('Product images are loaded', 
        (WidgetTester tester) async {
      await tester.pumpWidget(const CatalogApp());

      // Check if images exist
      expect(find.byType(Image), findsWidgets);
    });
  });
}
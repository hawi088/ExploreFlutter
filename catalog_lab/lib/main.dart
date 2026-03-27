import 'package:flutter/material.dart';
// Option 1: Use package import (if project name is catalog_lab)
import 'package:catalog_lab/screens/catalog_screen.dart';
// OR Option 2: Use relative import (if package import doesn't work)
// import 'screens/catalog_screen.dart';

void main() {
  runApp(const CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home:  CatalogScreen(),
    );
  }
}
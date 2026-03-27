import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String price;
  final String imageUrl;
  final Color color;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
  });
}
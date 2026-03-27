import 'package:flutter/material.dart';
import '../models/product.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  // Sample product data
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Coffee Mug',
      price: '\$12.99',
      imageUrl: 'https://picsum.photos/id/1/200/200',
      color: Colors.brown,
    ),
    Product(
      id: 2,
      name: 'Notebook',
      price: '\$5.99',
      imageUrl: 'https://picsum.photos/id/2/200/200',
      color: Colors.blue,
    ),
    Product(
      id: 3,
      name: 'Pen Set',
      price: '\$8.49',
      imageUrl: 'https://picsum.photos/id/3/200/200',
      color: Colors.green,
    ),
    Product(
      id: 4,
      name: 'Backpack',
      price: '\$49.99',
      imageUrl: 'https://picsum.photos/id/4/200/200',
      color: Colors.red,
    ),
    Product(
      id: 5,
      name: 'Headphones',
      price: '\$89.99',
      imageUrl: 'https://picsum.photos/id/5/200/200',
      color: Colors.grey,
    ),
    Product(
      id: 6,
      name: 'Smart Watch',
      price: '\$199.99',
      imageUrl: 'https://picsum.photos/id/6/200/200',
      color: Colors.black,
    ),
    Product(
      id: 7,
      name: 'Desk Lamp',
      price: '\$34.99',
      imageUrl: 'https://picsum.photos/id/7/200/200',
      color: Colors.yellow,
    ),
    Product(
      id: 8,
      name: 'Wireless Mouse',
      price: '\$24.99',
      imageUrl: 'https://picsum.photos/id/8/200/200',
      color: Colors.blueGrey,
    ),
    Product(
      id: 9,
      name: 'Keyboard',
      price: '\$79.99',
      imageUrl: 'https://picsum.photos/id/9/200/200',
      color: Colors.deepPurple,
    ),
    Product(
      id: 10,
      name: 'Monitor Stand',
      price: '\$45.99',
      imageUrl: 'https://picsum.photos/id/10/200/200',
      color: Colors.teal,
    ),
    Product(
      id: 11,
      name: 'Desk Mat',
      price: '\$19.99',
      imageUrl: 'https://picsum.photos/id/11/200/200',
      color: Colors.indigo,
    ),
    Product(
      id: 12,
      name: 'Webcam',
      price: '\$59.99',
      imageUrl: 'https://picsum.photos/id/12/200/200',
      color: Colors.cyan,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              color: product.color.withValues(alpha: 0.1),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You selected ${product.name}'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  
                  // Optional: Navigate to product details
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProductDetailScreen(product: product),
                  //   ),
                  // );
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
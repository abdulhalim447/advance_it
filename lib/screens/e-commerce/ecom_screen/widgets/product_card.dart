import 'package:advance_it_ltd/screens/e-commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Responsive card width based on screen size
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth;

    if (screenWidth >= 600) {
      // Large screen
      cardWidth = 160;
    } else if (screenWidth >= 360) {
      // Medium screen
      cardWidth = 140;
    } else {
      // Small screen
      cardWidth = 120;
    }

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
                width: double.infinity,
                // Placeholder and error widgets for better UX
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.broken_image, size: 40),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

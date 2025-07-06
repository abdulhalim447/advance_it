import 'package:advance_it_ltd/screens/e-commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'product_card.dart';

class CategorySection extends StatelessWidget {
  final String categoryTitle;
  final List<Product> products;

  const CategorySection({
    super.key,
    required this.categoryTitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive height for the horizontal list
    final double horizontalListHeight = MediaQuery.of(context).size.width > 600
        ? 220
        : 180;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryTitle.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                "See All",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: horizontalListHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
        //const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}

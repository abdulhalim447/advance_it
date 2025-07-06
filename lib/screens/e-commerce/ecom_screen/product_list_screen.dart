import 'package:advance_it_ltd/screens/e-commerce/ecom_screen/widgets/category_section.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final Future<Map<String, List<Product>>> _groupedProductsFuture;
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _groupedProductsFuture = _productService.fetchAndGroupProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<Product>>>(
      future: _groupedProductsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        final groupedProducts = snapshot.data!;
        final categories = groupedProducts.keys.toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final products = groupedProducts[category]!;
            return CategorySection(categoryTitle: category, products: products);
          },
        );
      },
    );
  }
}

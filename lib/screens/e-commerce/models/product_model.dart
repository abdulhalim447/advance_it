class Product {
  final String title;
  final String thumbnail;
  final String category;

  const Product({
    required this.title,
    required this.thumbnail,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      category: json['category'] as String,
    );
  }
}
